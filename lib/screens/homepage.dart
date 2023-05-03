import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/bottombar.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavCustom(),
      ),
      body: Center(child: Text('Homepage!')),
    );
  }
}
