import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Upcoming Bookings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: hexYellow,
            ),
          ),
          SizedBox(height: 10),
          _buildBookingCard(
            context,
            'Chennai to Trichy',
            '25 May 2023, 09:00 AM',
            'Seat: 10,11',
            'INR 500',
          ),
          SizedBox(height: 10),
          _buildBookingCard(
            context,
            'Trichy to Madurai',
            '27 May 2023, 02:00 PM',
            'Seat: 12,13',
            'INR 600',
          ),
          SizedBox(height: 20),
          Text(
            'Past Bookings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: hexYellow,
            ),
          ),
          SizedBox(height: 10),
          _buildBookingCard(
            context,
            'Chennai to Bangalore',
            '10 Apr 2023, 05:00 PM',
            'Seat: 8,9',
            'INR 800',
            isPastBooking: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, String title, String subtitle,
      String seatInfo, String price,
      {bool isPastBooking = false}) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          isPastBooking ? Icons.check_circle : Icons.access_time,
          color: isPastBooking ? Colors.green : Colors.blue,
          size: 40,
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(subtitle),
            SizedBox(height: 5),
            Text(seatInfo),
            SizedBox(height: 5),
            Text(price),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
