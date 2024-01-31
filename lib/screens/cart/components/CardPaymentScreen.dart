import 'package:flutter/material.dart';

class CardPaymentScreen extends StatefulWidget {
  @override
  _CardPaymentScreenState createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  String cardholderName = "";
  String cvv = "";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(_formatCardNumber);
    expiryDateController.addListener(_formatExpiryDate);
  }

  void _formatCardNumber() {
    String text = cardNumberController.text;
    text = text.replaceAll(RegExp(r'[^0-9]'), ''); // Remove non-numeric characters
    if (text.length > 16) {
      text = text.substring(0, 16); // Truncate to 16 digits
    }
    if (text.length > 4) {
      text = text.substring(0, 4) + '-' + text.substring(4);
    }
    if (text.length > 9) {
      text = text.substring(0, 9) + '-' + text.substring(9);
    }
    if (text.length > 14) {
      text = text.substring(0, 14) + '-' + text.substring(14);
    }
    cardNumberController.value = cardNumberController.value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  void _formatExpiryDate() {
    String text = expiryDateController.text;
    text = text.replaceAll(RegExp(r'[^0-9]'), ''); // Remove non-numeric characters
    if (text.length > 4) {
      text = text.substring(0, 4); // Truncate to 4 digits
    }
    if (text.length > 2) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }
    expiryDateController.value = expiryDateController.value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/card.png', // Replace with the actual path to your Visa card image
                width: 400, // Adjust the width as needed
              ),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: cardNumberController,
                      decoration: InputDecoration(labelText: "Card Number", hintText: "XXXX-XXXX-XXXX-XXXX"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid card number';
                        }
                        if (!RegExp(r'^\d{4}-\d{4}-\d{4}-\d{4}$').hasMatch(value)) {
                          return 'Please enter a valid card number in the format XXXX-XXXX-XXXX-XXXX';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (newValue) {
                        setState(() {
                          cardholderName = newValue;
                        });
                      },
                      decoration: InputDecoration(labelText: "Cardholder Name", hintText: "Enter your name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter cardholder name';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: expiryDateController,
                            decoration: InputDecoration(labelText: "Expiry Date", hintText: "MM/YY"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter expiry date';
                              }
                              if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
                                return 'Please enter a valid expiry date in the format MM/YY';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            onChanged: (newValue) {
                              setState(() {
                                cvv = newValue;
                              });
                            },
                            decoration: InputDecoration(labelText: "CVV", hintText: "123"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter CVV';
                              }
                              if (!RegExp(r'^\d{3}$').hasMatch(value)) {
                                return 'Please enter a valid CVV (3 digits)';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 250,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          // Save card details and navigate to checkout screen
                          // You can add your logic for saving the card details here
                          Navigator.pop(context);
                          // Close the CardPaymentScreen
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3C8ED3)),
                      ),
                      child: Text("Save", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
