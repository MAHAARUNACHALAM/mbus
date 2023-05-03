import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbus/components/appbar.dart';

import '../components/bottombar.dart';
import '../components/button_style.dart';
import '../providers/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode? mobile_focusnode;
  FocusNode? password_focusnode;
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  static const snackBar = SnackBar(
    content: Text('Invalid Credentials'),
  );
  @override
  void initState() {
    super.initState();
    mobile_focusnode = FocusNode();
    password_focusnode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    email.clear();
    password.clear();
    mobile_focusnode?.dispose();
    password_focusnode?.dispose();
  }

  bool validation() {
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter mobile number"),
      ));
      mobile_focusnode?.requestFocus();
      return false;
    }

    if (email.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid mobile number"),
      ));
      mobile_focusnode?.requestFocus();
      return false;
    }

    if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter password"),
      ));
      password_focusnode?.requestFocus();
      return false;
    }

    if (password.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid password"),
      ));
      password_focusnode?.requestFocus();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double value = ResponsiveWidget.isSmallScreen(context) ? 10 : 50;
    return Scaffold(
      appBar: BaseAppBar(),
      // bottomNavigationBar: BottomNavCustom(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: value, left: value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 160,
                    width: 160),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    "Welcome to mBus",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                  child: Text(
                    "Bus Ticket Booking",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      onChanged: (value) => {
                        if (value.length == 10)
                          {
                            FocusScope.of(context).nextFocus(),
                          }
                      },
                      controller: email,
                      maxLength: 10,
                      autofocus: true,
                      focusNode: mobile_focusnode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: 'Mobile',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      controller: password,
                      maxLength: 6,
                      focusNode: password_focusnode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: 'Password',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    style: buttonStyle,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      validation();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
