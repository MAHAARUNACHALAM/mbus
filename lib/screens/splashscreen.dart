import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbus/screens/prelogin.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splashscreen> {
  void splash() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var email = prefs.getString('email');
    // bool? isLoggedIn = prefs.getBool("isLoggedIn");
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PreLogin())));
  }

  @override
  void initState() {
    splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Image(
          image: AssetImage('assets/images/logo.png'),
        ));
  }
}
