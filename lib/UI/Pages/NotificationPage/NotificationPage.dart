import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Notification"
      ), 
      body: Center(
        child: Text(
          "No Notifications Yet",
        ),
      ),     
    );
  }
}