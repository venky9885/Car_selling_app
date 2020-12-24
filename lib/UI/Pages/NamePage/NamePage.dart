import 'dart:io';
import 'package:Cars/UI/BottomNavBar/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Cars/backend/FirebaseBackend.dart';
import 'package:Cars/Models/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';

Users user;

class NamePage extends StatefulWidget {
  String userPhone;
  NamePage({@required this.userPhone});
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  String get phoneNumber => widget.userPhone;
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  String userName;
  File userImage;
  String filePath;


  void captureWithCamera() async {
    Navigator.pop(context);
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      userImage = File(pickedFile.path);
    });
  }

  void pickImageFromGallery() async {
    Navigator.pop(context);
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      userImage = File(pickedFile.path);
    });
  }

  Future<void> dialogBox(context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: new Text(
            "Choose a photo",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                "Pick image from galary",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: pickImageFromGallery,
            ),
            SimpleDialogOption(
              child: Text(
                "Capture Image with Camera",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: captureWithCamera,
            ),
            SimpleDialogOption(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Profile Info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please provide your name ",
                  style: TextStyle(
                    color: Color(0xFF818181),
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: MediaQuery.of(context).size.width / 4.8,
                      backgroundImage: userImage == null
                          ? NetworkImage('')
                          : FileImage(userImage),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.teal,
                        size: 30,
                      ),
                      onPressed: () {
                        dialogBox(context);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: _nameWidget(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: Colors.indigo,
                    onPressed: () {
                      var instance = FirebaseAuth.instance.currentUser;
                      String uid = instance.uid;
                      setState(() {
                        user = Users(
                          uid: uid,
                          name: userName,
                          phoneNumber: widget.userPhone,
                          image: userImage,
                        );
                      });
                      FirebaseFunctions().createUserRecord(user);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameWidget() {
    return TextFormField(
      key: _nameKey,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) {
        if (value.isEmpty) {
          return 'Cannot be empty';
        }
      },
      onChanged: (value) {
        setState(
          () {
            userName = value;
          },
        );
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Name',
      ),
    );
  }
}
