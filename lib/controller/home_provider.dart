import 'package:flutter/material.dart';
import 'package:the_animation/model/activity_model.dart';

class HomeProvider extends ChangeNotifier {
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
}
