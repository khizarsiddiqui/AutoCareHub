import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            _buildListTile("Contact Information:", [
              'Email: info@autocarehub.pk',
              'Emergency Contact: +92 317 8906226',
            ]),
            _buildListTile("Description:", [
              'If you are looking for a trustworthy, reliable company for your automobile repair needs, look no further.',
              'Service Hours:',
              'Monday           : 9:00am - 7:00pm',
              'Tuesday           : 9:00am - 7:00pm',
              'Wednesday     : 9:00am - 7:00pm',
              'Thursday         : 9:00am - 7:00pm',
              'Friday              : OFF',
              'Saturday         : 9:00am - 7:00pm',
              'Sunday            : 9:00am - 7:00pm',
            ]),
            _buildListTile("How may I help you?", [
              'Please feel free to contact us if you have any questions, concerns, or issues.',
            ]),
            // Add more help content as needed
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, List<String> content) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.map((text) {
          return Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.justify, // Justify text
            ),
          );
        }).toList(),
      ),
    );
  }
}
