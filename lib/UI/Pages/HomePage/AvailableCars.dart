import 'package:Cars/Models/Cars.dart';
import 'package:Cars/UI/Pages/HomePage/CarBoxBig.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'BookCar.dart';

class AvailableCars extends StatefulWidget {
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  List<Car> cars = getCars();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Available Cars",
        isLeading: true,
        isAction: true,
        action: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: HexColor('#F8FAFB'),
      body: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: cars.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookCar(car: item),
                ),
              );
            },
            child: carAdLong(item, 0),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> buildcarLong() {
    List<Widget> list = [];
    for (int i = 0; i < cars.length; i++) {
      cars[i].isApproved
          ? list.add(
              carAdLong(cars[i], context),
            )
          : i++;
    }
    return list;
  }
}
