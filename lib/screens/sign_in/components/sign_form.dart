import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/custom_surfix_icon.dart';
import 'package:mechanics_mangao/components/form_error.dart';
import 'package:mechanics_mangao/helper/keyboard.dart';
import 'package:mechanics_mangao/screens/forgot_password/forgot_password_screen.dart';
import 'package:mechanics_mangao/screens/home/home_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  bool isPasswordVisible = false;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ForgotPasswordScreen.routeName,
                ),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try {
                  final UserCredential userCredential =
                  await _auth.signInWithEmailAndPassword(
                    email: email!,
                    password: password!,
                  );

                  if (userCredential.user != null) {
                    KeyboardUtil.hideKeyboard(context);
                    // Use pushNamedAndRemoveUntil to remove login and splash screens from the stack
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                          (route) => false, // Remove all previous routes
                    );

                    final User user = userCredential.user!;
                    await storeUserInDatabase(user.uid, email!, password!);
                  }
                } catch (e) {
                  print("Sign-in Error: $e");
                  if (e is FirebaseAuthException) {
                    if (e.code == 'user-not-found') {
                      addError(
                        error: "Email is incorrect. Please check your email.",
                      );
                    } else if (e.code == 'wrong-password') {
                      addError(
                        error: "Password is incorrect. Please try again.",
                      );
                    } else {
                      addError(
                        error: "Please check Email and Password.",
                      );
                    }
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: !isPasswordVisible,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
      },
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          child: CustomSurffixIcon(
            svgIcon: isPasswordVisible
                ? "assets/icons/eye.svg"
                : "assets/icons/eye-off.svg",
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/mail.svg"),
      ),
    );
  }

  Future<void> storeUserInDatabase(
      String userId, String email, String password) async {
    try {
      DatabaseReference userRef = _database.ref().child('users');
      DatabaseReference newUserRef = userRef.child(userId);
      await newUserRef.set({
        'email': email,
        'password': password,
      });
    } catch (e) {
      print("Database Error: $e");
    }
  }
}
