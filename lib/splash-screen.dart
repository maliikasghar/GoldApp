import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      //Navigator
      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => GoldAppScreen()),
      Get.to(()=>GoldAppScreen());
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Column(
        children: [
          Spacer(), // Pushes content below towards the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('lib/assets/goldicon.png'),
                  height: 100,
                ),
                SizedBox(height: 10), // Adds spacing between image and text
                Text(
                  'Gold App',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(), // Pushes the name to the bottom of the screen
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Developed by Muhammad Asghar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
