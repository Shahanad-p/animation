import 'package:flutter/material.dart';

class ImpleciteProvider extends ChangeNotifier {
  double margin = 10;
  double height = 500;
  double width = 500;
  Color color = Colors.green;
  double opacity = 1;

  void animatedButton() {
    margin = 50;
    height = 250;
    width = 250;
    color = Colors.red;
    notifyListeners();
  }
}
