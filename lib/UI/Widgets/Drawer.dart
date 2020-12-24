import 'package:Cars/Themes/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
//import 'dart:io';
import 'package:Cars/backend/FirebaseAuth.dart';

Widget myDrawer(String userName, String phoneNumber, String userImage) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          accountEmail: phoneNumber.length == 0
              ? Text("")
              : Text(
                  "${phoneNumber}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
          accountName: Text(
            "${userName}",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          currentAccountPicture: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Image(
              image: userImage == null
                  ? NetworkImage('')
                  : NetworkImage(userImage),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Home"),
          leading: Icon(EvaIcons.homeOutline),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Account"),
          leading: Icon(EvaIcons.personOutline),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Cars"),
          leading: Icon(EvaIcons.hardDrive),
        ),
        SizedBox(height: 10),
        SizedBox(height: 20),
        Divider(),
        ListTile(
          title: Text("Help"),
          leading: Icon(EvaIcons.questionMarkCircleOutline),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Share"),
          leading: Icon(EvaIcons.share),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Rate us"),
          leading: Icon(EvaIcons.edit2),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Logout"),
          leading: Icon(EvaIcons.logOut),
          onTap: () => AuthService().signOut(),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    ),
  );
}
