import 'package:flutter/material.dart';
import 'package:mechanics_mangao/autoshow/book_tickets.dart';
import 'package:mechanics_mangao/autoshow/register_car.dart';

class AutoShow extends StatelessWidget {
  const AutoShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Show Booking',
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register Car for Auto Show',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/auto show.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 180,
                width: 360,
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 60, // Increase the height of the button
                  width: 250, // Increase the width of the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the "register_car" page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisterCar(), // Replace with the actual widget for your "register_car" page
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF3C8ED3), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Add border radius to the button
                      ),
                    ),
                    child: const Text(
                      'Register Car',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(color: Color(0xFF3C8ED3)),
              const Text(
                'Book Ticket for Auto Show',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/auto show.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 180,
                width: 360,
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 60, // Increase the height of the button
                  width: 250, // Increase the width of the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the "register_car" page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BookTickets(), // Replace with the actual widget for your "register_car" page
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF3C8ED3), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Add border radius to the button
                      ),
                    ),
                    child: const Text(
                      'Book Ticket',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
