import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_animation/view/home.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // to validate the entered credential
  bool validateCredential(String username, String password) {
    return username == 'hello' && password == 'hello';
  }

  //to save the username and and password is sharedpreference
  Future<void> saveCredential(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
    notifyListeners();
  }

  //to handle logic button press
  void login(context) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    bool isValid = validateCredential(username, password);
    if (isValid) {
      saveCredential(username, password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      notifyListeners();
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      notifyListeners();
    }
    notifyListeners();
  }
}
