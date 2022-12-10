import 'dart:async';
import 'package:adminthaimeet/screens/homescreen.dart';
import 'package:adminthaimeet/screens/inAppScreen/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adminthaimeet/screens/registerscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getUserLoggedIn();
    super.initState();
  }

  getUserLoggedIn() async{
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    final bool? repeat = sharedpreference.getBool('isLogin');
    final String? email = sharedpreference.getString('email');
    final String? password= sharedpreference.getString("password");
    print("Shared value got  ${repeat}");
    Future.delayed(
        const Duration(seconds: 3),
            () => {
          if (repeat == true)
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  HomeScreen(
                        email: email,
                        password: password,
                      ))),
            }
          else
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("A trip to thailand"),
          Image.asset("assets/image.png", width: 30, height: 30)
        ],
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/splashimage.png", width: 350, height: 350),
            const Text(
              "Thaimeet \n     2022",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
