import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_store_app/main.dart';
import 'package:medical_store_app/screens/on_boardscreen.dart';
import 'package:medical_store_app/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isShow ? OnBoardscreen() : SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/logo_background.png'),
                fit: BoxFit.fill),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff2D9CDB),
                Color(0xff2F80ED),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.1,
                  child: Center(
                    child: Image.asset('images/Vector.png'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Quick Medical',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          )),
    );
  }
}
