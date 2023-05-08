import 'package:flutter/material.dart';

import '../providers/hexColor.dart';
import 'client/help.dart';
import 'client/home.dart';
import 'client/myaccount.dart';
import 'client/mybooking.dart';
import 'client/notfound.dart';

class Dashboard extends StatefulWidget {
  int indexing;

  Dashboard({
    this.indexing = 0,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  late int page;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
      Icon(
        Icons.home,
        color: Color.fromRGBO(91, 55, 183, 1),
      ),
      Text(
        'TicGet',
        style: TextStyle(
            color: Color.fromRGBO(91, 55, 183, 1), fontWeight: FontWeight.bold),
      ),
      Color.fromRGBO(223, 215, 243, 1),
    ),
    NavigationItem(
        Icon(Icons.bus_alert, color: Color.fromRGBO(115, 6, 82, 1)),
        Text(
          'Bookings',
          style: TextStyle(
              color: Color.fromRGBO(115, 6, 82, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(244, 211, 235, 1)),
    NavigationItem(
        Icon(
          Icons.help,
          color: Color.fromRGBO(206, 32, 32, 1),
        ),
        Text(
          'Help',
          style: TextStyle(
              color: Color.fromRGBO(206, 32, 32, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(251, 239, 211, 1)),
    NavigationItem(
        Icon(Icons.person_outline, color: Color.fromRGBO(17, 148, 170, 1)),
        Text(
          'My Account',
          style: TextStyle(
              color: Color.fromRGBO(17, 148, 170, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(211, 235, 239, 1))
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.black,
                ),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColorNav),
                        child: item.title)
                    : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget currentpages(int index) {
    switch (index) {
      case 0:
        return new Home();
        break;
      case 1:
        return new MyBookingScreen();
        break;
      case 2:
        return new Help();
        break;
      case 3:
        return new MyAccount();
        break;
      default:
        return new NotFound();
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    page = widget.indexing;
    super.initState();
  }

  Widget titles(int index) {
    switch (index) {
      case 0:
        return Text("TicGet");
        break;
      case 1:
        return Text("My Booking");
        break;
      case 2:
        return Text("Help");
        break;
      case 3:
        return Text("My Account");
        break;
      default:
        return Text("Not Found");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
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
          title: titles(page),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ]),
      bottomNavigationBar: Container(
        height: 56,
        padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
        decoration: BoxDecoration(
            color: hexYellow,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            shape: BoxShape.rectangle,
            //To get border radius
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  page = itemIndex;
                });
              },
              child: _buildItem(item, page == itemIndex),
            );
          }).toList(),
        ),
      ),
      body: currentpages(page),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(this.icon, this.title, this.color);
}
