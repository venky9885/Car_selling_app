import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
import 'SellCar2.dart';

class SellCar extends StatefulWidget {
  @override
  _SellCarState createState() => _SellCarState();
}

class _SellCarState extends State<SellCar> {
  String carNum;
  String dmDriven;
  String carbrand;
  String modelNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(
          title: "Sell a Car",
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Enter the details of your Car",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/images/sellCar.png',
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Step 1 of 4",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: carNumber(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: kmDriven(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: brand(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: brandModelNumber(),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Colors.indigo,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellCar2(
                          carBrand: carbrand,
                          carNumber: carNum,
                          kmDriven: dmDriven,
                          modelNumber: modelNumber,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
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

  Widget carNumber() {
    return TextFormField(
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        hintText: "Enter Car Number - (DLASAA7783)",
        prefixIcon: Icon(Icons.drive_eta),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          carNum = value.toUpperCase();
        });
      },
    );
  }

  Widget brand() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Enter Car's brand",
        prefixIcon: Icon(Icons.speed),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          carbrand = value.toString();
        });
      },
    );
  }

  Widget brandModelNumber() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Enter Car's Model Number",
        prefixIcon: Icon(Icons.speed),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          modelNumber = value;
        });
      },
    );
  }

  Widget kmDriven() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Enter Car Driven (in KM)",
        prefixIcon: Icon(
          Icons.drive_eta,
        ),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          dmDriven = value.toString().trim();
        });
      },
    );
  }
}
