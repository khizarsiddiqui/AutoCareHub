
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TicketSuccessScreen extends StatelessWidget {
  const TicketSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ticked Booked",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF3C8ED3),
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
              "Ticket Booked Successfully!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
