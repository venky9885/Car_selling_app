import 'package:Cars/UI/Widgets/AppBar.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Car Request",
        isLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: NetworkImage(''),
          ),
          title: Text("Mahindra"),
          subtitle: Text("DLASAA"),
          trailing: IconButton(
            icon: Icon(
              Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
