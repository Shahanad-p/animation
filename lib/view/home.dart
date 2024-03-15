import 'package:flutter/material.dart';
import 'package:the_animation/model/activity_model.dart';
import 'package:the_animation/view/details_screen.dart';
import 'package:the_animation/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Activity> activityList = [];
  @override
  void initState() {
    super.initState();
    activityList = [
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 113, 152),
      appBar: AppBar(
        title: Text('Activities', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 1),
                builder: (BuildContext context, double value, Widget? child) {
                  return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(top: value * 30),
                      child: child,
                    ),
                  );
                },
                child: AppText(
                  data: 'Pick Your favourite activity',
                  color: Colors.black,
                  size: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                child: ListView.builder(
                  itemCount: activityList.length,
                  itemBuilder: (context, index) {
                    Activity activity = activityList[index];
                    return buildCard(activity, context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard(Activity activity, context) {
  return Card(
    color: const Color.fromARGB(255, 212, 204, 204),
    child: Container(
      height: 100,
      child: Center(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  activity: activity,
                ),
              ),
            );
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: 'imageUrl${activity.imageUrl}',
              child: Image.asset(
                activity.imageUrl,
                height: 100,
              ),
            ),
          ),
          trailing: AppText(
            data: activity.price.toString(),
          ),
          title: AppText(data: activity.name),
          subtitle: AppText(data: activity.location),
        ),
      ),
    ),
  );
}
