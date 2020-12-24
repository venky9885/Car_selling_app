import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  Color backgroundColor;
  Color titleColor;
  Color contentColor;
  String title;
  String content;
  Icon titleIcon;
  AdminCard({
    this.backgroundColor,
    this.content,
    this.contentColor,
    this.title,
    this.titleColor,
    this.titleIcon
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          titleIcon,
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              color: contentColor,
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

