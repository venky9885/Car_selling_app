import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
import 'SellCar3.dart';

class SellCar2 extends StatefulWidget {
  String carNumber;
  String kmDriven;
  String carBrand;
  String modelNumber;
  SellCar2({
    this.carBrand,
    this.carNumber,
    this.kmDriven,
    this.modelNumber,
  });
  @override
  _SellCar2State createState() => _SellCar2State();
}

class _SellCar2State extends State<SellCar2> {
  String get carNumber => widget.carNumber;
  String get carBrand => widget.carBrand;
  String get kmDriven => widget.kmDriven;
  String get modelNumber => widget.modelNumber;
  bool hasInsuranc;
  bool insuranceSelected = false;
  String carPrice;
  bool priceSelected = false;
  bool hasPollutio;
  bool pollutionSelected = false;
  String boughtDat;
  String ownerShip;
  bool ownserShipSelected = false;
  bool carRC;
  bool rcSelected = false;
  String _choosenDate;
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
              "Step 2 of 4",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
              ),
              child: chooseOwnership(),
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
              child: boughtDate(),
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
              child: hasInsurance(),
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
              child: hasPollution(),
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
              child: hasRC(),
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
              child: price(),
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
                      builder: (context) => SellCar3(
                        carBrand: widget.carBrand,
                        carNumber: widget.carNumber,
                        date: _choosenDate,
                        hasCarRC: carRC,
                        hasInsurance: hasInsuranc,
                        hasPollution: hasPollutio,
                        kmDriven: kmDriven,
                        modelNumber: modelNumber,
                        price: carPrice,
                        ownerShip: ownerShip,
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

  Widget hasPollution() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: new Text(
                "Do you have Car's pollution",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      hasPollutio = true;
                      pollutionSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SimpleDialogOption(
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      hasPollutio = false;
                      pollutionSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.date_range),
            SizedBox(
              width: 10,
            ),
            Text(
              !pollutionSelected
                  ? "Do you have Car's pollution"
                  : hasPollutio == true
                      ? "Yes"
                      : "No",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hasInsurance() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: new Text(
                "Do you have Car's insurance",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        hasInsuranc = true;
                        insuranceSelected = true;
                      });
                      Navigator.pop(context);
                    }),
                Divider(),
                SimpleDialogOption(
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      hasInsuranc = false;
                      insuranceSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.date_range),
            SizedBox(
              width: 10,
            ),
            Text(
              !insuranceSelected
                  ? "Do you have Car's insurance"
                  : hasInsuranc == true
                      ? "Yes"
                      : "No",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget hasRC() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: new Text(
                "Do you have Car's RC",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      carRC = true;
                      rcSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SimpleDialogOption(
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      carRC = false;
                      rcSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.date_range),
            SizedBox(
              width: 10,
            ),
            Text(
              !rcSelected
                  ? "Do you have Car's RC"
                  : rcSelected == true
                      ? "Yes"
                      : "No",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget chooseOwnership() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: new Text(
                "Car OwnerShip status",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: Text(
                    "First",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ownerShip = "First";
                      ownserShipSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SimpleDialogOption(
                  child: Text(
                    "Second",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ownerShip = "Second";
                      ownserShipSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SimpleDialogOption(
                  child: Text(
                    "Third",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ownerShip = "Third";
                      ownserShipSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SimpleDialogOption(
                  child: Text(
                    "Above",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ownerShip = "Above";
                      ownserShipSelected = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SimpleDialogOption(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.date_range),
            SizedBox(
              width: 10,
            ),
            Text(
              !ownserShipSelected ? "Choose your Ownership" : ownerShip,
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Widget boughtDate() {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime(2020),
          firstDate: DateTime(1990),
          lastDate: DateTime(2021),
        ).then(
          (value) {
            setState(
              () {
                if (!(value == null)) {
                  setState(() {
                    _choosenDate = value.toString();
                  });
                  isDateChosen = true;
                }
                if (value.isAfter(
                  DateTime.now(),
                )) {
                  setState(
                    () {
                      isError = true;
                    },
                  );
                }
              },
            );
          },
        ).catchError(
          (onError) {
            print(onError);
          },
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.date_range),
            SizedBox(
              width: 10,
            ),
            !isDateChosen
                ? Text(
                    "Choose your bought date",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  )
                : Text(
                    _choosenDate.toString().substring(0, 11),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
            isError ? Text("Error") : Text("")
          ],
        ),
      ),
    );
  }

  Widget price() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter extimate price in ₹",
        prefixIcon: Icon(Icons.money),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(
          () {
            priceSelected = true;
            carPrice = value.toString();
          },
        );
      },
    );
  }
}
