import 'package:flutter/material.dart';

class SuperAdminOverview extends StatefulWidget {
  const SuperAdminOverview({super.key});

  @override
  State<SuperAdminOverview> createState() => _SuperAdminOverviewState();
}

class _SuperAdminOverviewState extends State<SuperAdminOverview> {
  final List<Bus> buses = [
    Bus(name: 'Bus A', route: 'Route 1', capacity: 50, occupancy: 35),
    Bus(name: 'Bus B', route: 'Route 2', capacity: 40, occupancy: 28),
    Bus(name: 'Bus C', route: 'Route 3', capacity: 60, occupancy: 45),
    Bus(name: 'Bus D', route: 'Route 4', capacity: 30, occupancy: 22),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Revenue',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Rs.5,00,000',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.currency_rupee_sharp,
                  color: Colors.green,
                  size: 40.0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: buses.length,
                itemBuilder: (context, index) {
                  final bus = buses[index];
                  return ListTile(
                    title: Text(bus.name),
                    subtitle: Text(
                        'Route: ${bus.route}\nCapacity: ${bus.capacity}\nOccupancy: ${bus.occupancy}'),
                  );
                })),
      ],
    );
  }
}

class Bus {
  final String name;
  final String route;
  final int capacity;
  final int occupancy;

  Bus({
    required this.name,
    required this.route,
    required this.capacity,
    required this.occupancy,
  });
}
