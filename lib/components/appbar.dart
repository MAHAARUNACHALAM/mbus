import 'package:flutter/material.dart';

import '../providers/hexColor.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
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
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
