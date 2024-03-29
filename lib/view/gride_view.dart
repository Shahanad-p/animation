// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 113, 152),
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 50,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 3,
              duration: Duration(milliseconds: 1500),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(8.10),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Hello',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
