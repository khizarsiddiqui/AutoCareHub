
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PackageSuccessScreen extends StatelessWidget {
  const PackageSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appointment Booked",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF3C8ED3),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/order_success_animation.json',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Appointment Booked Successfully!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
              child: const Text(
                "Continue Shopping",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3C8ED3),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
