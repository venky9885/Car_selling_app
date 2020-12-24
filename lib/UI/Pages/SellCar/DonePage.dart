import 'package:flutter/material.dart';
import 'package:Cars/UI/BottomNavBar/BottomNavBar.dart';

class DonePage extends StatefulWidget {
  String carNumber;
  DonePage({
    this.carNumber,
  });
  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/done.png",
              width: 90,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "You car has been",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "successfully uploaded",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Car Number : " + widget.carNumber,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavScreen(),
                ),
              );
            },
            color: Colors.indigo,
            child: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
