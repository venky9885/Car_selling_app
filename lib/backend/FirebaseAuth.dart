import 'package:Cars/Models/Users.dart';
import 'package:Cars/UI/OnBoardScreen/OnBoardScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Cars/UI/BottomNavBar/BottomNavBar.dart';
// import 'package:Cars/UI/Pages/PhoneRegister/Register.dart';
// import 'package:Cars/UI/Pages/NamePage/NamePage.dart';
// import 'FirebaseBackend.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//import '';

var userReference = FirebaseFirestore.instance.collection("Users");
Users users;

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class AuthService {
  //bool data;
  fetchPhone(String num) {
    //bool data;
    Query data = userReference
        .orderBy("Phone Number")
        .where("Phone Number", isEqualTo: num);
    //equalTo(num);

    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return BottomNavScreen();
        } else {
          return OnBoardingScreen();
        }
      },
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(
    AuthCredential authCredential,
  ) async {
    await FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  void signInWithOTP(smsCode, verificationID) {
    AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: smsCode,
    );
    signIn(authCredential);
  }
}
