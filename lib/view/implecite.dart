import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_animation/controller/implecite_provider.dart';

class ImpleciteAnimation extends StatefulWidget {
  const ImpleciteAnimation({super.key});

  @override
  State<ImpleciteAnimation> createState() => _ImpleciteAnimationState();
}

class _ImpleciteAnimationState extends State<ImpleciteAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 113, 152),
      body: Consumer<ImpleciteProvider>(
        builder: (context, value, child) => Center(
          child: AnimatedContainer(
            height: value.height,
            width: value.width,
            duration: Duration(seconds: 1),
            margin: EdgeInsets.all(value.margin),
            color: value.color,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    value.animatedButton();
                  },
                  child: Text('Animated')),
            ),
          ),
        ),
      ),
    );
  }
}
