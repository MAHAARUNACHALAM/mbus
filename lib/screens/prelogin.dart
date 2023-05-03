import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';
import 'package:mbus/screens/signup.dart';

import '../config/app_config.dart';
import 'login.dart';

class PreLogin extends StatefulWidget {
  PreLogin({Key? key}) : super(key: key);

  @override
  _PreLoginState createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context)!;

    return Scaffold(
      backgroundColor: hexYellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              // child: Image(image: AssetImage('assets/images/icon.png')),
              ),
          // Spacer(),
          Column(
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 250,
                width: 250,
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(2.5)),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
