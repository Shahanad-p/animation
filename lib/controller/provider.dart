
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_animation/model/activity_model.dart';
import 'package:the_animation/view/home.dart';

class AllProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Activity> activityList = [];
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void addActivity() {
    List<Activity> activities = [
      Activity(
        name: 'New York City',
        location: 'America',
        imageUrl:
            'assets/beautiful-view-empire-states-skyscrapers-new-york-city.jpg',
        price: 25000,
      ),
      Activity(
        name: 'Bangkok Thailand City',
        location: 'Bangkok',
        imageUrl:
            'assets/view-from-rooftop-china-town-middle-city-bangkok-thailand.jpg',
        price: 26700,
      ),
      Activity(
        name: 'Maldives Island',
        location: 'South Asia',
        imageUrl: 'assets/maldives-island.jpg',
        price: 28500,
      ),
      Activity(
        name: 'Pyrenees Mountain',
        location: 'France and Spain',
        imageUrl: 'assets/pyrenees-mountain-landscape-with-village.jpg',
        price: 31500,
      ),
      Activity(
        name: 'Ko sichang island',
        location: 'Thailand',
        imageUrl: 'assets/aerial-view-cottage-si-chang-island-thailand.jpg',
        price: 30500,
      ),
      Activity(
        name: 'Yixing sunset',
        location: 'Wuxi jiangsu china',
        imageUrl: 'assets/landscape-with-sunset-yixing.jpg',
        price: 29500,
      ),
    ];
    Future slideListItems = Future(() {});
    for (var activity in activities) {
      slideListItems = slideListItems.then((value) {
        return Future.delayed(Duration(microseconds: 1500), () {
          activityList.add(activity);
          listKey.currentState!.insertItem(activityList.length - 1);
        });
      });
      notifyListeners();
    }
    notifyListeners();
  }

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
