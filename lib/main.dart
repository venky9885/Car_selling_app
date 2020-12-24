import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:Cars/UI/AdminPanel/AdminPanel.dart';
import './backend/FirebaseAuth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
    );
  }
}
