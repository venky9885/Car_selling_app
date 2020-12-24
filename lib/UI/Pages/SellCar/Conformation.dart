import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
//import 'dart:io';
import 'package:Cars/Models/Cars.dart';
import 'package:Cars/backend/FirebaseBackend.dart';
import 'DonePage.dart';

class ConfirmationPage extends StatefulWidget {
  String name;
  String phoneNumber;
  String email;
  String carBrand;
  String carModel;
  bool hasInsurance;
  bool hasRC;
  bool hasPollution;
  String dateofPurchase;
  String carNumber;
  String ownerShip;
  String price;
  String milage;
  String location;
  bool isApproved;
  int seats;
  String kmDriven;
  List images;
  ConfirmationPage({
    this.carBrand,
    this.carModel,
    this.dateofPurchase,
    this.email,
    this.hasInsurance,
    this.hasPollution,
    this.hasRC,
    this.images,
    this.isApproved,
    this.location,
    this.milage,
    this.name,
    this.ownerShip,
    this.phoneNumber,
    this.price,
    this.kmDriven,
    this.seats,
    this.carNumber,
  });

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Car car;
  @override
  void initState() {
    super.initState();
    setState(() {
      car = Car(
        brand: widget.carBrand,
        dealerName: widget.name,
        dealerPhoneNumber: widget.phoneNumber,
        hasInsurance: widget.hasInsurance,
        hasPollution: widget.hasPollution,
        images: widget.images,
        isApproved: false,
        isAvailable: true,
        kmDriven: widget.kmDriven,
        model: widget.carModel,
        price: widget.price,
        carNumber: widget.carNumber,
        dateofPurchased: "",
        location: widget.location,
        milage: "0",
        sellerEmail: widget.email,
        seats: widget.seats.toString().length > 0 ? widget.seats : 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Confirm your details",
        isLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/images/sellCar2.jpg',
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Confirmation",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              color: Colors.indigo,
              onPressed: () {
                FirebaseFunctions().createCarRecord(car);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonePage(
                      carNumber: widget.carNumber,
                    ),
                  ),
                );
              },
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
