import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_animation/controller/provider.dart';
import 'package:the_animation/model/activity_model.dart';
import 'package:the_animation/view/details_screen.dart';
import 'package:the_animation/view/gride_view.dart';
import 'package:the_animation/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AllProvider>(context, listen: false);
      provider.addActivity();
    });
  }

  Tween<Offset> offsetBuilder = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 113, 152),
      appBar: AppBar(
          title: Text('Activities', style: TextStyle(color: Colors.black)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GridViewScreen()));
            },
            icon: Icon(Icons.apps),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                curve: Curves.easeIn,
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
              Consumer<AllProvider>(
                builder: (context, value, child) => Flexible(
                  child: AnimatedList(
                    key: value.listKey,
                    initialItemCount: value.activityList.length,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(offsetBuilder),
                        child: buildCard(value.activityList[index], context),
                      );
                    },
                  ),
                ),
              ),
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
    child: SizedBox(
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
