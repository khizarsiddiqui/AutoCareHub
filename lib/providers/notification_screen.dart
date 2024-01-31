import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "/notification";
  static List<String> notifications = [];

  static void addNotification(String notification) {
    notifications.add(notification);
  }

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: NotificationScreen.notifications.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(NotificationScreen.notifications[index]),
            onDismissed: (direction) {
              setState(() {
                NotificationScreen.notifications.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title: Text(NotificationScreen.notifications[index]),
              // Add any other widgets you want in the ListTile
            ),
          );
        },
      ),
    );
  }
}
