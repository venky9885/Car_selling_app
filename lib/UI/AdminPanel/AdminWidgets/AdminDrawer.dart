import 'package:Cars/Themes/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../AdminSubpages/Requests.dart';
import '../AdminSubpages/Users.dart';

String imageUrl =
    'https://scontent.fdel5-1.fna.fbcdn.net/v/t1.0-9/480128_4549413205633_620077564_n.jpg?_nc_cat=110&ccb=2&_nc_sid=de6eea&_nc_ohc=g2eXmmK70kAAX8F5J6A&_nc_ht=scontent.fdel5-1.fna&oh=193ce9613936ce743efebab7d0b200e5&oe=60013BFF';

Widget myDrawer(context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          accountEmail: Text(
            "TSTakkar@gmail.com",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          accountName: Text(
            "TS Takkar",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          currentAccountPicture: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Image(
              image: NetworkImage(imageUrl),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Requests"),
          leading: Icon(EvaIcons.activity),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Requests(),
            ),
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text("Users"),
          leading: Icon(EvaIcons.personOutline),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllUsers(),
            ),
          ),
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
          title: Text("Logout"),
          leading: Icon(EvaIcons.logOut),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    ),
  );
}
