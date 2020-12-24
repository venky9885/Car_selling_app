import 'package:Cars/UI/Pages/NamePage/NamePage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:Cars/backend/FirebaseAuth.dart';
import 'package:Cars/backend/toggle state.dart';
import 'package:Cars/UI/BottomNavBar/BottomNavBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OTPScreenPage extends StatefulWidget {
  String phoneNumber;
  String verificationID;

  OTPScreenPage({
    @required this.phoneNumber,
    @required this.verificationID,
  });
  @override
  _OTPScreenPageState createState() => _OTPScreenPageState();
}

class _OTPScreenPageState extends State<OTPScreenPage> {
  String smsCode;
  TextEditingController _pinCodeController = TextEditingController();
  ToggleStateManagement togg = ToggleStateManagement();

  @override
  void dispose() {
    super.dispose();
    _pinCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 5,
            ),
            Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Text(
              "CarsFin sent your code to ",
              style: TextStyle(color: Color(0xFF818181), fontSize: 18),
            ),
            Text(
              "${widget.phoneNumber.substring(0, 8)} ******",
              style: TextStyle(color: Color(0xFF818181), fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 5,
            ),
            _phoneCodeWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Colors.indigo,
                  onPressed: () {
                    Query data = userReference.orderBy("Phone Number").where(
                        "Phone Number",
                        isEqualTo: widget.phoneNumber.toString());
                    print(data);
                    AuthService().signInWithOTP(smsCode, widget.verificationID);
                    if (data == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NamePage(
                            userPhone: widget.phoneNumber.toString(),
                          ),
                        ),
                      );
                    } else if (data != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ),
                      );
                    }
                    //--
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _phoneCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Column(
        children: [
          PinCodeTextField(
            onChanged: (pin) {
              print(pin);
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              inactiveColor: Colors.indigo,
              activeColor: Colors.green,
            ),
            keyboardType: TextInputType.number,
            controller: _pinCodeController,
            appContext: context,
            length: 6,
            obscureText: true,
            autoDisposeControllers: false,
            onCompleted: (pin) {
              setState(() {
                smsCode = pin;
              });
              print(smsCode);
            },
          ),
          Text(
            "Enter your 6 digit code",
            style: TextStyle(
              color: Color(0xFF818181),
            ),
          )
        ],
      ),
    );
  }
}
