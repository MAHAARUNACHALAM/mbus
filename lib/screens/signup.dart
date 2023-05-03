//create a signin page login page but extra one confirm password field
//create a signup page

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/appbar.dart';
import '../components/button_style.dart';
import '../providers/responsive.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FocusNode? mobile_focusnode;
  FocusNode? password_focusnode;
  FocusNode? cnf_password_focusnode;

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController cnf_password = new TextEditingController();
  TextEditingController _verificationCodeController = TextEditingController();
  var verificationId;

  static const snackBar = SnackBar(
    content: Text('Invalid Credentials'),
  );
  @override
  void initState() {
    super.initState();
    mobile_focusnode = FocusNode();
    password_focusnode = FocusNode();
    cnf_password_focusnode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    email.clear();
    password.clear();
    mobile_focusnode?.dispose();
    password_focusnode?.dispose();
    cnf_password_focusnode?.dispose();
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
    if (password.text != cnf_password.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password and Confirm Password should be same"),
      ));
      cnf_password_focusnode?.requestFocus();
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
      body: SingleChildScrollView(
        child: Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        maxLength: 6,
                        focusNode: cnf_password_focusnode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20.0),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: 'Confirm Password',
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
                        'Signup',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        validation();
                        //Add mobile verification part through firebase and once verified call api to register user
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91${email.text}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            // set verificationId to a variable
                            setState(() {
                              verificationId = verificationId;
                            });
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                        // Define a TextEditingController to handle the verification code input

// Show a dialog box to prompt the user to enter the verification code
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Enter Verification Code'),
                              content: TextFormField(
                                controller: _verificationCodeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter code here',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Submit'),
                                  onPressed: () async {
                                    // Get the verification code entered by the user
                                    String verificationCode =
                                        _verificationCodeController.text.trim();

                                    // Create a PhoneAuthCredential with the verification code
                                    PhoneAuthCredential credential =
                                        PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: verificationCode,
                                    );

                                    // Sign in the user with the PhoneAuthCredential
                                    try {
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);
                                      // Call your API to perform any necessary actions
                                      // ...

                                      // Close the dialog box and navigate to the home screen
                                      Navigator.pop(context);
                                      print("Authenticated");
                                    } catch (e) {
                                      // Display an error message if the verification code is invalid
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Invalid verification code. Please try again.'),
                                      ));
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
