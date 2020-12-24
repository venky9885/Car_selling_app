import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
import 'package:geolocator/geolocator.dart';
import 'SellCar4.dart';
import 'package:Cars/Services/ValidatingServices.dart';
import 'package:geocoding/geocoding.dart';

class SellCar3 extends StatefulWidget {
  String carNumber;
  String kmDriven;
  String carBrand;
  String modelNumber;
  bool hasInsurance;
  bool hasCarRC;
  bool hasPollution;
  String price;
  String date;
  String ownerShip;
  SellCar3({
    this.carBrand,
    this.carNumber,
    this.kmDriven,
    this.modelNumber,
    this.date,
    this.hasCarRC,
    this.hasInsurance,
    this.hasPollution,
    this.price,
    this.ownerShip,
  });
  @override
  _SellCar3State createState() => _SellCar3State();
}

class _SellCar3State extends State<SellCar3> {
  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placeMars =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark mplaceMark = placeMars[0];
    String completeAddressIntro =
        '${mplaceMark.subThoroughfare} ${mplaceMark.thoroughfare}, ${mplaceMark.subLocality} ${mplaceMark.locality}, ${mplaceMark.administrativeArea}, ${mplaceMark.postalCode}, ${mplaceMark.country}';

    String specificAdress = '${mplaceMark.locality}, ${mplaceMark.country}';
    print(specificAdress);
    print("FULL ADDRESS : " + completeAddressIntro);
    return specificAdress;
  }

  String dealerName;
  String dealerContact;
  String dealerEmail;
  String loc;
  var _choosenDate = null;
  bool isDateChosen = false;
  bool isError = false;
  @override
  void initState() {
    super.initState();
    print(widget.carBrand);
    print(widget.carNumber);
    print(widget.hasCarRC);
    print(widget.date);
    print(widget.kmDriven);
    print(widget.modelNumber);
    print(widget.hasCarRC);
    print(widget.hasInsurance);
    print(widget.hasPollution);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: "Sell a Car",
        isLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              "Step 3 of 4",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
              ),
              child: name(),
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
              child: contactNumber(),
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
              child: email(),
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
              child: location(),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellCar4(
                        carBrand: widget.carBrand,
                        carNumber: widget.carNumber,
                        hasCarRC: widget.hasCarRC,
                        hasInsuranc: widget.hasInsurance,
                        hasPollutio: widget.hasPollution,
                        kmDriven: widget.kmDriven,
                        modelNumber: widget.modelNumber,
                        email: dealerEmail,
                        location: loc,
                        name: dealerName,
                        phoneNumber: dealerContact,
                        price: widget.price,
                        date: widget.date,
                        ownerShip: widget.ownerShip,
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
    );
  }

  Widget name() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter your Name",
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          dealerName = value;
        });
      },
    );
  }

  Widget email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: "Enter your Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          dealerEmail = value;
        });
        validator:
        ValidateService().validateEmail(value);
      },
    );
  }

  bool locations = false;
  Widget location() {
    return Row(
      children: [
        MaterialButton(
          color: Colors.green,
          onPressed: () {
            setState(() async {
              loc = await getUserLocation();
              locations = true;
            });
            print(loc);
          },
          child: Text(
            "Get my current location",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        locations == false
            ? Text("")
            : Text(
                loc,
                style: TextStyle(fontSize: 14, color: Colors.black),
              )
      ],
    );
  }

  Widget contactNumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Enter your Phone Number",
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(
          () {
            dealerContact = value;
          },
        );
      },
    );
  }
}
