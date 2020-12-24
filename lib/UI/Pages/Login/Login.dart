import 'package:flutter/material.dart';
import 'package:Cars/UI/AdminPanel/AdminPanel.dart';

String password = "Gmail.com@12345";
String gmail = "tstakkar@gmail.com";
String inputPasswrod;
String inputEmail;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                Image.network(
                    'https://assets.stickpng.com/images/580b585b2edbce24c47b2c18.png',
                    width: MediaQuery.of(context).size.width * 0.5),
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: _enterEmail(),
                ),
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
                        if (inputEmail == gmail && inputPasswrod == password) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminPanel(),
                            ),
                          );
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
                    )),
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
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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

  Widget _enterEmail() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email',
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
          inputEmail = value;
        });
      },
    );
  }

  Widget _enterPhoneNumber() {
    return TextFormField(
      // textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return ("Cannot be empty");
        }
      },
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          inputPasswrod = value;
        });
      },
    );
  }
}
