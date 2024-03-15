import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:the_animation/model/activity_model.dart';
import 'package:the_animation/widgets/favorite.dart';

class DetailScreen extends StatelessWidget {
  final Activity activity;
  const DetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Hero(
                tag: 'imageUrl${activity.imageUrl}',
                child: Image.asset(
                  activity.imageUrl,
                  height: 460,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    activity.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                  HeartIcon(),
                ],
              ),
              subtitle: Text(
                '\$ ${activity.price} Only',
                style: TextStyle(letterSpacing: 0, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                loremIpsum(
                  words: 70,
                  paragraphs: 7,
                  initWithLorem: true,
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
