import 'package:flutter/material.dart';
import 'package:mbus/components/button_style.dart';

import 'adminManageBus.dart';

class AdminAccount extends StatefulWidget {
  const AdminAccount({super.key});

  @override
  State<AdminAccount> createState() => _AdminAccountState();
}

class _AdminAccountState extends State<AdminAccount> {
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
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              // TODO: Fetch the list of buses from the backend
              final busList =
                  getDummyBusList(); // Replace with your implementation
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusListScreen(buses: busList),
                ),
              );
            },
            child: Text('List My buses')),
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

List<Bus> getDummyBusList() {
  return [
    Bus(
      id: 'bus-001',
      name: 'Volvo AC Bus',
      description: 'Volvo AC bus with comfortable seating',
      capacity: 40,
    ),
    Bus(
      id: 'bus-002',
      name: 'Non AC Bus',
      description: 'Non AC bus with standard seating',
      capacity: 50,
    ),
    Bus(
      id: 'bus-003',
      name: 'Luxury Bus',
      description: 'Luxury bus with reclining seats and Wi-Fi',
      capacity: 30,
    ),
  ];
}
