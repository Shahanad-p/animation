
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_animation/controller/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/3d-portrait-people.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Consumer<AllProvider>(
                  builder: (context, value, child) => Column(
                    children: [
                      Text('Login',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: value.usernameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Colors.transparent,
                            filled: true,
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: value.passwordController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Colors.transparent,
                            filled: true,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => value.login(context),
                        child: Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 36, 119, 39),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
