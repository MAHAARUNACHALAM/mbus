import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: hexYellow,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Q: How do I book a bus ticket?\nA: To book a bus ticket, follow these steps:\n1. Open the app\n2. Select your starting and destination cities\n3. Choose your travel dates\n4. Select a bus from the available options\n5. Enter passenger details\n6. Make payment\n7. Receive your ticket',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: hexYellow,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'If you have any questions or issues, please contact our support team:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Email: support@mBus.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Phone: +91 7418274846',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
