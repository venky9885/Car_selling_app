import './FirebaseAuth.dart';
import 'package:Cars/UI/BottomNavBar/BottomNavBar.dart';
import 'package:Cars/UI/Pages/NamePage/NamePage.dart';

class ToggleStateManagement {
  String phone;
  toggleState() {
    if (AuthService().fetchPhone(phone)) {
      return BottomNavScreen();
    } else {
      return NamePage(userPhone: phone);
    }
  }
}
/////},
