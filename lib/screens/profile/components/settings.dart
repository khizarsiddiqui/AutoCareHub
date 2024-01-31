import 'package:flutter/material.dart';

// import '../../../main.dart';
// import '../../../theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;


  @override
  Widget build(BuildContext context) {
    // Apply dark mode theme based on _darkModeEnabled
    // var theme = _darkModeEnabled ? ThemeData.dark() : ThemeData.light();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.black)),
        flexibleSpace: FlexibleSpaceBar(
        ),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            SwitchListTile(
              title: Text('Enable Notifications', style: TextStyle(color: Colors.black)),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Enable Location', style: TextStyle(color: Colors.black)),
              value: _locationEnabled,
              onChanged: (value) {
                setState(() {
                  _locationEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

