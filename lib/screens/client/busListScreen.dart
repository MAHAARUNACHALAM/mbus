import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';

import '../../components/appbar.dart';

class BusListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: ListView.builder(
        itemCount: _busList.length,
        itemBuilder: (BuildContext context, int index) {
          final bus = _busList[index];
          return Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.directions_bus,
                color: hexYellow,
                size: 40,
              ),
              title: Text(bus.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(bus.route),
                  SizedBox(height: 5),
                  Text(bus.departureTime),
                  SizedBox(height: 5),
                  Text(bus.arrivalTime),
                  SizedBox(height: 5),
                  Text('Price: ${bus.price}'),
                ],
              ),
              trailing: ElevatedButton(
                child: Text('Book Now'),
                onPressed: () {
                  // Navigate to booking screen
                  Navigator.pushNamed(context, '/passenger');
                },
                style: ElevatedButton.styleFrom(
                  primary: hexYellow,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Bus {
  final String name;
  final String route;
  final String departureTime;
  final String arrivalTime;
  final double price;

  Bus({
    required this.name,
    required this.route,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
  });
}

final List<Bus> _busList = [
  Bus(
    name: 'ABC Travels',
    route: 'Chennai to Trichy',
    departureTime: '09:00 AM',
    arrivalTime: '12:00 PM',
    price: 350.0,
  ),
  Bus(
    name: 'XYZ Travels',
    route: 'Chennai to Madurai',
    departureTime: '10:00 AM',
    arrivalTime: '02:00 PM',
    price: 500.0,
  ),
  Bus(
    name: 'PQR Travels',
    route: 'Trichy to Coimbatore',
    departureTime: '11:00 AM',
    arrivalTime: '05:00 PM',
    price: 450.0,
  ),
];
