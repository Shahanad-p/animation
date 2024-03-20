import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_animation/controller/implecite_provider.dart';
import 'package:the_animation/controller/home_provider.dart';
import 'package:the_animation/controller/login_provider.dart';
import 'package:the_animation/view/login.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ImpleciteProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
