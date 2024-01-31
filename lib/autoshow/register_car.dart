import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mechanics_mangao/providers/notification_screen.dart';

class RegisterCar extends StatefulWidget {
  const RegisterCar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterCarState createState() => _RegisterCarState();
}

class _RegisterCarState extends State<RegisterCar> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _carnoplateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Car Registration Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Owner Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return 'Name should only contain alphabets';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                      return 'Phone number must be 11 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _cnicController,
                  decoration: const InputDecoration(labelText: 'CNIC'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your CNIC';
                    }
                    if (!RegExp(r'^\d{13}$').hasMatch(value)) {
                      return 'CNIC must be 13 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _carModelController,
                  decoration: const InputDecoration(labelText: 'Car Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter car model';
                    }
                    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return 'Car model only contain alphabets';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _carnoplateController,
                  decoration: const InputDecoration(labelText: 'Car No-Plate'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your car no';
                    }
                    if (!RegExp(r'^[a-zA-Z]+-\d+$').hasMatch(value)) {
                      return 'Invalid car no-plate format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String carNoPlate = _carnoplateController.text;
                            _addCarDataToFirestore();
                            // Add notification to the NotificationScreen
                            NotificationScreen.addNotification(
                              'Your car with No-Plate $carNoPlate has been registered for Auto Show.',
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Your car has been registered for Auto Show')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF3C8ED3),
                          ),
                        ),
                        child: const Text('Confirm Registration',
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addCarDataToFirestore() {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String cnic = _cnicController.text;
    String carModel = _carModelController.text;
    String carNoPlate = _carnoplateController.text;

    _firestore.collection('autoshow').add({
      'name': name,
      'phone': phone,
      'cnic': cnic,
      'carModel': carModel,
      'carNoPlate': carNoPlate,
    });
    _nameController.clear();
    _phoneController.clear();
    _cnicController.clear();
    _carModelController.clear();
    _carnoplateController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cnicController.dispose();
    _carModelController.dispose();
    _carnoplateController.dispose();
    super.dispose();
  }
}
