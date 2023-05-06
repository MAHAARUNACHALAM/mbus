import 'package:flutter/material.dart';
import 'package:mbus/components/button_style.dart';

class SuperAdminAccount extends StatefulWidget {
  const SuperAdminAccount({super.key});

  @override
  State<SuperAdminAccount> createState() => _SuperAdminAccountState();
}

class _SuperAdminAccountState extends State<SuperAdminAccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/maha.png'),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Mahaarunachalam S',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'smahaarunachalam@gmail.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  // TODO: Implement sign-out functionality
                },
                child: Text('Sign out'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
