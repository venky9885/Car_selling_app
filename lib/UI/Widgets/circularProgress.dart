import 'package:Cars/Themes/constants.dart';
import 'package:flutter/material.dart';

Widget circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 10.0
    ),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(kPrimaryColor),
    ),
  );
}
