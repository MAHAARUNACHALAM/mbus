import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  _MyBookingScreenState createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  late Dio _dio;
  List<Booking> _bookings = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _dio.get(
          'http://192.168.37.49:5051/api/Bus/getBooking',
          queryParameters: {'Id': 580});
      print(response.data);

      List<dynamic> bookings = response.data;
      List<Booking> BookingList = [];
      for (var booking in bookings) {
        BookingList.add(Booking.fromJson(booking));
      }

      setState(() {
        _bookings = BookingList;
      });
    } catch (e) {
      print('Failed to fetch bookings: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _buildBookingList();
  }

  Widget _buildBookingList() {
    return ListView.builder(
      itemCount: _bookings.length,
      itemBuilder: (context, index) {
        final booking = _bookings[index];
        return Card(
          child: ListTile(
            title: Text('${booking.source} to ${booking.destination}'),
            subtitle:
                Text('Date: ${booking.date}\nBooking ID: ${booking.bookingId}'),
            trailing: Text('\$${booking.price}'),
          ),
        );
      },
    );
  }
}

class Booking {
  final String id;
  final String bookingId;
  final String source;
  final String destination;
  final String date;
  final String price;
  final String busid;

  Booking({
    required this.id,
    required this.bookingId,
    required this.source,
    required this.destination,
    required this.date,
    required this.price,
    required this.busid,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      bookingId: json['bookingId'] as String,
      source: json['source'] as String,
      destination: json['destination'] as String,
      date: json['date'] as String,
      price: json['price'],
      busid: json['busId'] as String,
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:mbus/providers/hexColor.dart';

// class MyBooking extends StatefulWidget {
//   const MyBooking({super.key});

//   @override
//   State<MyBooking> createState() => _MyBookingState();
// }

// class _MyBookingState extends State<MyBooking> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 20),
//           Text(
//             'Upcoming Bookings',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: hexYellow,
//             ),
//           ),
//           SizedBox(height: 10),
//           _buildBookingCard(
//             context,
//             'Chennai to Trichy',
//             '25 May 2023, 09:00 AM',
//             'Seat: 10,11',
//             'INR 500',
//           ),
//           SizedBox(height: 10),
//           _buildBookingCard(
//             context,
//             'Trichy to Madurai',
//             '27 May 2023, 02:00 PM',
//             'Seat: 12,13',
//             'INR 600',
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Past Bookings',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: hexYellow,
//             ),
//           ),
//           SizedBox(height: 10),
//           _buildBookingCard(
//             context,
//             'Chennai to Bangalore',
//             '10 Apr 2023, 05:00 PM',
//             'Seat: 8,9',
//             'INR 800',
//             isPastBooking: true,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBookingCard(BuildContext context, String title, String subtitle,
//       String seatInfo, String price,
//       {bool isPastBooking = false}) {
//     return Card(
//       elevation: 3.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         leading: Icon(
//           isPastBooking ? Icons.check_circle : Icons.access_time,
//           color: isPastBooking ? Colors.green : Colors.blue,
//           size: 40,
//         ),
//         title: Text(title),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 5),
//             Text(subtitle),
//             SizedBox(height: 5),
//             Text(seatInfo),
//             SizedBox(height: 5),
//             Text(price),
//           ],
//         ),
//         trailing: IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }
