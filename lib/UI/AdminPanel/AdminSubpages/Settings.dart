import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';

String url =
    'https://assets.materialup.com/uploads/53a51966-b17f-4f52-a2d8-e34c38b12d5c/preview';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Settings",
          isLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(33.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90,
                child: Image.network(url),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Change password",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Enter your old password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Enter your new password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Enter your new password",
                ),
              ),
              SizedBox(
                height: 60,
              ),
              MaterialButton(
                color: Colors.indigo,
                onPressed: () {},
                child: Text(
                  "Change",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
