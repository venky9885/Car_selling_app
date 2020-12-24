import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
//import 'DonePage.dart';
import 'Conformation.dart';
import 'dart:io';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';

List<File> fileImageArray = [];

class SellCar4 extends StatefulWidget {
  String carNumber;
  String kmDriven;
  String carBrand;
  String modelNumber;
  bool hasInsuranc;
  bool hasCarRC;
  String ownerShip;
  bool hasPollutio;
  String name;
  String date;
  String email;
  String location;
  String phoneNumber;
  String price;
  SellCar4(
      {this.carBrand,
      this.carNumber,
      this.hasCarRC,
      this.hasInsuranc,
      this.hasPollutio,
      this.kmDriven,
      this.modelNumber,
      this.email,
      this.location,
      this.name,
      this.phoneNumber,
      this.price,
      this.date,
      this.ownerShip});
  @override
  _SellCar4State createState() => _SellCar4State();
}

class _SellCar4State extends State<SellCar4> {
  String price;
  String date;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 30,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Choose Car Images ",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) {
      return;
    }

    setState(
      () {
        images = resultList;
        _error = error;
      },
    );
    images.forEach((imageAsset) async {
      final filePath =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);

      File tempFile = File(filePath);
      if (tempFile.existsSync()) {
        fileImageArray.add(tempFile);
      }
    });
  }

  bool isDateChosen = false;
  bool isError = false;
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
              "Step 4 of 4",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
              ),
              child: MaterialButton(
                onPressed: () => loadAssets(),
                color: Colors.indigo,
                child: Text(
                  "Choose Images",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            // Expanded(child: buildGridView()),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
              ),
              // child: hasInsurance(),
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
              // child: hasPollution(),
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
              // child: hasRC(),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: Colors.indigo,
                onPressed: () {
                  print(images.length);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationPage(
                        carBrand: widget.carBrand,
                        images: fileImageArray,
                        carNumber: widget.carNumber,
                        hasRC: widget.hasCarRC,
                        name: widget.name,
                        phoneNumber: widget.phoneNumber,
                        hasInsurance: widget.hasInsuranc,
                        hasPollution: widget.hasPollutio,
                        kmDriven: widget.kmDriven,
                        location: widget.location,
                        carModel: widget.modelNumber,
                        price: widget.price,
                        email: widget.email,
                        ownerShip: widget.ownerShip,
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
      ),
    );
  }
}
