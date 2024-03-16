import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({Key? key}) : super(key: key);

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Change here
  late Animation<Color?> colorAnimation; // Change here
  late Animation<double?> sizeAnimation; // Change here
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween(begin: 50, end: 30), weight: 50) // Change here
      ],
    ).animate(_controller); // Change here
    colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFavorite = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFavorite = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            isFavorite ? _controller.reverse() : _controller.forward();
          },
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: sizeAnimation.value ?? 30, // Change here
          ),
        );
      },
    );
  }
}
