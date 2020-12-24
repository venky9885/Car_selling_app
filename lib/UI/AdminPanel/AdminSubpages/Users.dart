//import 'package:Cars/backend/FirebaseAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Cars/UI/Widgets/AppBar.dart';
//import 'package:Cars/UI/Widgets/circularProgress.dart';

var userReference = FirebaseFirestore.instance.collection("Users");

class AllUsers extends StatefulWidget {
  @override
  AllUsersState createState() => AllUsersState();
}

class AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Users",
        isLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      // body: StreamBuilder(
      //   stream: userReference.snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final List list = AdminFirebase().getAllUser();
      //       return Container(
      //         child: ListView(
      //           children: list.map((user) {
      //             return ListTile(
      //               title: user,
      //             );
      //           }).toList(),
      //         ),
      //       );
      //     } else {
      //       return circularProgress();
      //     }
      //   },
      // ));
    );
  }
}

// body: ListView(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         children: cars.map((item) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BookCar(car: item),
//                 ),
//               );
//             },
//             child: carAdLong(item, 0),
//           );
//         }).toList(),
//       ),
