import 'package:Cars/Models/Cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var userReference = FirebaseFirestore.instance.collection("Users");
var carReference = FirebaseFirestore.instance.collection("Cars");

class AdminFirebase {
  Future<void> changePassword(String oldPassword, String newPassword) {
    var response = FirebaseFirestore.instance;
    response.collection("Admin").doc("Admin").update(
      {
        "Password": newPassword,
      },
    );
  }

  Future<void> approveCar(Car car) async {
    var response = await FirebaseFirestore.instance;
    response.collection("Cars").doc(car.carNumber).update(
      {
        "Is Approved": true,
      },
    );
    response.collection("Admin").doc("Admin").update(
      {
        "Cars Approved": FieldValue.increment(1),
      },
    );
  }

  Future<int> countUsers() async {
    int count = 0;
    userReference.get().then(
      (snapshot) {
        snapshot.docs.forEach(
          (element) {
            count += 1;
          },
        );
      },
    );
    return count;
  }

  Future<int> countCars() async {
    int count = 0;
    carReference.get().then(
      (snapshot) {
        snapshot.docs.forEach(
          (element) {
            count += 1;
          },
        );
      },
    );
    return count;
  }

  Future<List> getAllUser() async {
    List<dynamic> list;
    userReference.get().then(
      (snapshot) {
        snapshot.docs.forEach(
          (element) {
            list.add(element.data());
          },
        );
      },
    );
    return list;
  }
}
