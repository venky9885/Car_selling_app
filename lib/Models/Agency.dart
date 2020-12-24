import 'dart:io';

class Agency {
  String agencyName;
  String agencyLocation;
  String agencyPhoneNumber;
  String agencyEmail;
  File images;
  int carsSold;
  int carsUploaded;
  Agency({
    this.agencyLocation,
    this.agencyName,
    this.carsSold,
    this.agencyPhoneNumber,
    this.images,
    this.carsUploaded,
    this.agencyEmail,
  });
}
