//create superadmin dashboard page and add drawer to it and add logout button to it

import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';

import '../components/bottombar.dart';

class SuperAdminDashboard extends StatefulWidget {
  @override
  _SuperAdminDashboardState createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Image(
          //   image: AssetImage('assets/images/logo.png'),
          // ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: hexYellow,
          centerTitle: true,
          title: const Text(
            "mBus",
            style: TextStyle(
              fontFamily: "NunitoSans",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ]),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Super Admin'),
          accountEmail: Text('9962561400'),
        )
      ])),
      bottomNavigationBar: BottomNavCustom(),
    );
  }
}
