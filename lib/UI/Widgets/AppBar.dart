import 'package:flutter/material.dart';

AppBar appBar({
  bool isLeading = false,
  bool isAction = false,
  bool isAppTitle = true,
  String title,
  Widget leading,
  Widget action,
}) {
  return AppBar(
    elevation: 0,
    title: Text(
      isAppTitle ? title : "",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: isLeading ? leading : null,
    actions: isAction ? [action] : null,
  );
}
