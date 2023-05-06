import 'package:flutter/material.dart';
import 'package:mbus/components/appbar.dart';

class Bus {
  final String id;
  final String name;
  final String description;
  final int capacity;

  Bus({
    required this.id,
    required this.name,
    required this.description,
    required this.capacity,
  });
}

class BusListScreen extends StatelessWidget {
  final List<Bus> buses;

  const BusListScreen({Key? key, required this.buses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (context, index) {
          final bus = buses[index];
          return ListTile(
            title: Text(bus.name),
            subtitle: Text(bus.description),
            trailing: Text('Capacity: ${bus.capacity}'),
            onTap: () {
              // TODO: Navigate to bus details screen
            },
          );
        },
      ),
    );
  }
}
