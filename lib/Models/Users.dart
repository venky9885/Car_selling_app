import 'package:flutter/material.dart';
import 'dart:io';

class Users {
  String uid;
  String name;
  String phoneNumber;
  String location;
  File image;
  int carSold;
  String imageUrl;
  int carBought;
  String dateofBirth;
  Users({
    @required this.uid,
    this.location,
    @required this.name,
    @required this.phoneNumber,
    this.image,
    this.carBought,
    this.carSold,
    this.imageUrl,
    this.dateofBirth,
  });
}
