import 'package:flutter/material.dart';

class ImpleciteAnimation extends StatefulWidget {
  const ImpleciteAnimation({super.key});

  @override
  State<ImpleciteAnimation> createState() => _ImpleciteAnimationState();
}

class _ImpleciteAnimationState extends State<ImpleciteAnimation> {
  double margin = 10;
  double height = 500;
  double width = 500;
  Color color = Colors.green;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          height: height,
          width: width,
          duration: Duration(seconds: 1),
          margin: EdgeInsets.all(margin),
          color: color,
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    margin = 50;
                    height = 250;
                    width = 250;
                    color = Colors.red;
                  });
                },
                child: Text('Animated')),
          ),
        ),
      ),
    );
  }
}
