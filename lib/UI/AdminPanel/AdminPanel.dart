import 'package:flutter/material.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
import 'AdminWidgets/CardWidget.dart';
import 'AdminWidgets/AdminDrawer.dart';
import 'AdminSubpages/Settings.dart';
import 'package:Cars/backend/FirebaseAdmin.dart';

String imageUrl =
    'https://scontent.fdel5-1.fna.fbcdn.net/v/t1.0-9/480128_4549413205633_620077564_n.jpg?_nc_cat=110&ccb=2&_nc_sid=de6eea&_nc_ohc=g2eXmmK70kAAX8F5J6A&_nc_ht=scontent.fdel5-1.fna&oh=193ce9613936ce743efebab7d0b200e5&oe=60013BFF';
GlobalKey<ScaffoldState> drawerKey = GlobalKey();
AdminFirebase adminFirebase;
int count;

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  Future<int> getUser() async {
    count = await AdminFirebase().countUsers();
    return count;
  }

  Future<List> users() async {
    return adminFirebase.getAllUser();
  }

  @override
  void initState() {
    getUser();
    users();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      backgroundColor: Colors.white,
      appBar: appBar(
        isAction: true,
        action: IconButton(
          icon: Icon(Icons.settings),
          color: Colors.black,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Settings(),
            ),
          ),
        ),
        isAppTitle: true,
        title: "Admin Panel",
        isLeading: true,
        leading: IconButton(
          onPressed: () {
            drawerKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      drawer: myDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 28,
            ),
            Text(
              "Welcome Admin",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Total Cars sold",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "17",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdminCard(
                  titleIcon:
                      Icon(Icons.supervised_user_circle, color: Colors.white),
                  backgroundColor: Colors.amber,
                  title: "Users",
                  content: count.toString(),
                  titleColor: Colors.indigo,
                  contentColor: Colors.white,
                ),
                AdminCard(
                  titleIcon: Icon(
                    Icons.drive_eta,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.indigo,
                  title: "Cars",
                  content: "9460",
                  titleColor: Colors.amber,
                  contentColor: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AdminCard(
                      titleIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.pink,
                      title: "Agencies",
                      content: "94",
                      titleColor: Colors.white,
                      contentColor: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
