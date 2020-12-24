import 'package:flutter/material.dart';
//import 'dart:io';

class Car {
  String brand;
  String model;
  String price;
  String condition;
  String description;
  List images;
  String location;
  String dealerName;
  String dealerPhoneNumber;
  String sellerEmail;
  String carNumber;
  String kmDriven;
  int seats;
  String milage;
  bool isAvailable = true;
  bool hasRC;
  bool hasInsurance;
  bool hasPollution;
  String otherFeatures;
  String dateofPurchased;
  bool isApproved;
  Car({
    @required this.brand,
    @required this.price,
    @required this.images,
    @required this.dealerName,
    @required this.dealerPhoneNumber,
    @required this.kmDriven,
    @required this.isAvailable,
    @required this.model,
    @required this.hasInsurance,
    @required this.hasPollution,
    @required this.isApproved,
    this.condition,
    this.description,
    this.location,
    this.sellerEmail,
    this.carNumber,
    this.seats,
    this.milage,
    this.dateofPurchased,
    this.otherFeatures,
  });
}

List<Car> getCars() {
  return <Car>[
    Car(
      isApproved: true,
      milage: "34kmpl",
      hasPollution: false,
      location: "Burari, Delhi",
      model: "A50SD",
      kmDriven: "9432",
      hasInsurance: true,
      brand: "Maruti Suzuki",
      carNumber: "DL8SAA7783",
      price: "96541",
      images: [
        "assets/images/land_rover_0.png",
        "assets/images/ferrari_spider_488_0.png"
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
        isApproved: true,
        milage: "34kmpl",
        hasPollution: true,
        location: "UK, London",
        model: "50DD",
        kmDriven: "9432",
        hasInsurance: false,
        brand: "TATA",
        carNumber: "DL8SAA7783",
        price: "96541",
        images: [
          "assets/images/nissan_gtr_0.png",
          "assets/images/ferrari_spider_488_0.png"
        ],
        dealerName: "Jayant",
        dealerPhoneNumber: "9654981773",
        isAvailable: true),
    Car(
      isApproved: false,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      model: "50DD",
      kmDriven: "94302",
      hasInsurance: true,
      brand: "Ferarri",
      carNumber: "DL8SAA7783",
      price: "96541",
      images: [
        "assets/images/land_rover_0.png",
        "assets/images/man.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
      isApproved: false,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      hasInsurance: false,
      model: "50DD",
      kmDriven: "9432",
      brand: "TATA",
      carNumber: "DL8SAA7783",
      price: "96541",
      images: [
        "assets/images/land_rover_0.png",
        "assets/images/man.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
      isApproved: true,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      model: "50DD",
      kmDriven: "9432",
      hasInsurance: true,
      brand: "Audi",
      price: "96541",
      carNumber: "DL8SAA7783",
      images: [
        "assets/images/land_rover_0.png",
        "assets/images/man.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
      isApproved: true,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      hasInsurance: true,
      model: "50DD",
      kmDriven: "9432",
      brand: "TATA",
      carNumber: "DL8SAA7783",
      price: "96541",
      images: [
        "assets/images/land_rover_0.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
      isApproved: true,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      hasInsurance: true,
      model: "50DD",
      kmDriven: "9432",
      brand: "TATA",
      carNumber: "DL8SAA7783",
      price: "96541",
      images: [
        "assets/images/land_rover_0.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
      isApproved: true,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      hasInsurance: false,
      model: "50DD",
      kmDriven: "9432",
      brand: "TATA",
      price: "96541",
      carNumber: "DL8SAA7783",
      images: [
        "assets/images/land_rover_0.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
    Car(
      isApproved: true,
      milage: "34kmpl",
      hasPollution: true,
      location: "UK, London",
      hasInsurance: false,
      model: "50DD",
      kmDriven: "9432",
      brand: "TATA",
      price: "96541",
      carNumber: "DL8SAA7783",
      images: [
        "assets/images/land_rover_0.png",
      ],
      dealerName: "Jayant",
      dealerPhoneNumber: "9654981773",
      isAvailable: true,
    ),
  ];
}
