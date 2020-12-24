import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Cars/backend/FirebaseAuth.dart';
import 'package:Cars/backend/FirebaseBackend.dart';

String password = "Gmail.com@12345";
String gmail = "tstakkar@gmail.com";
String inputPasswrod;
String inputEmail;
bool isExist;

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool codeSent = false;
  String phoneNo, verificationId, smsCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Image.asset(
                  "assets/images/user.png",
                  width: 160,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Text(
                    "Please Sign in to continue ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 9),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: _enterPhoneNumber(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                codeSent
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        child: _enterOTP(),
                      )
                    : Text(""),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: InkWell(
                    onTap: () {
                      FirebaseFunctions().getUser(phoneNo).then((value) {
                        setState(() {
                          isExist = value;
                        });
                      });
                      if (isExist) {
                        print("Exit");
                        // codeSent
                        //     ? AuthService()
                        //         .signInWithOTP(smsCode, verificationId)
                        //     : verifyPhone(phoneNo);
                      } else {
                        print("DOES NOT");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.amber[600],
                      ),
                      height: 36,
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _enterOTP() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'OTP',
          border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return 'Number is required';
        }
        if (!value.contains(".") && !value.contains("@")) {
          return "Invalid email";
        }
      },
      onChanged: (value) {
        setState(() {
          smsCode = value;
        });
      },
    );
  }

  Widget _enterPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value.isEmpty) {
          return ("Cannot be empty");
        }
      },
      decoration: InputDecoration(
        icon: Icon(Icons.phone),
        labelText: "Phone Number",
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          phoneNo = "+91" + " " + value.trim();
        });
      },
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed = (authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) async {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
      await Fluttertoast.showToast(
        msg: "OTP send",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 30),
      verificationCompleted: verified,
      verificationFailed: verificationfailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }
}
