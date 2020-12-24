import 'package:Cars/Models/Cars.dart';
import 'package:Cars/Themes/constants.dart';
import 'package:flutter/material.dart';


Widget buildCar(Car car, int index){
  return SingleChildScrollView(
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(
        right: index != null ? 15 : 0, 
        left: index == 0 ? 16 : 0
      ),
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8, 
                  vertical: 0
                ),
                child: Text(
                  car.condition,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 90,
            child: Center(
              child: Hero(
                tag: car.model,
                child: Image.asset(
                  car.images[0],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Text(
            car.model,
            style: TextStyle(
              fontSize: 18
            ),
          ),

          SizedBox(
            height: 8,
          ),
          Text(
            car.brand,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            "per " + (car.condition == "Daily" ? "day" : car.condition == "Weekly" ? "week" : "month"),
            style: TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}