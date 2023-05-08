import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/appbar.dart';

class BusListScreen extends StatefulWidget {
  List<Bus> busList;
  BusListScreen({Key? key, required this.busList}) : super(key: key);
  @override
  State<BusListScreen> createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  //deseerialize the json data

  void initState() {
    print(widget.busList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: ListView.builder(
        itemCount: widget.busList.length,
        itemBuilder: (BuildContext context, int index) {
          Bus bus = widget.busList[index];
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
                  Text('Departure: ${bus.departure}'),
                  Text('Arrival: ${bus.arrival}'),
                  Text('Available Seats: ${bus.availableSeats}'),
                  Text('Bus Type: ${bus.busType}'),
                  Text('Price: ${bus.price}'),
                ],
              ),
              trailing: ElevatedButton(
                child: Text('Book Now'),
                onPressed: () async {
                  // Navigate to booking screen
                  //set reference id to shared preferences
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('referenceId', bus.referenceId);
                  prefs.setString('source', bus.source);
                  prefs.setString('destination', bus.destination);
                  prefs.setString('date', bus.departure);
                  prefs.setString('price', bus.price.toString());
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
  final String busNumber;
  final String name;
  final String source;
  final String destination;
  final String departure;
  final String arrival;
  final int totalSeats;
  final int availableSeats;
  final int price;
  final String busType;
  final String referenceId;

  Bus({
    required this.busNumber,
    required this.name,
    required this.source,
    required this.destination,
    required this.departure,
    required this.arrival,
    required this.totalSeats,
    required this.availableSeats,
    required this.price,
    required this.busType,
    required this.referenceId,
  });
  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      busNumber: json['busNumber'],
      name: json['name'],
      source: json['source'],
      destination: json['destination'],
      departure: json['departure'],
      arrival: json['arrival'],
      totalSeats: json['totalSeats'],
      availableSeats: json['availableSeats'],
      price: json['price'],
      busType: json['busType'],
      referenceId: json['referenceId'],
    );
  }
}
