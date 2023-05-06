import 'package:flutter/material.dart';
import 'package:mbus/components/appbar.dart';

import 'adminRaiseTicket.dart';

class TicketListScreen extends StatelessWidget {
  const TicketListScreen({Key? key}) : super(key: key);

  // TODO: Fetch the ticket list from your backend system
  List<Ticket> getDummyTicketList() {
    return [
      Ticket(
        subject: 'Internet is down',
        description: 'I am unable to connect to the internet.',
        status: 'open',
        timestamp: DateTime.now(),
      ),
      Ticket(
        subject: 'Email not working',
        description: 'I am unable to send or receive emails.',
        status: 'closed',
        timestamp: DateTime.now().subtract(Duration(days: 2)),
      ),
      Ticket(
        subject: 'Printer not working',
        description: 'I am unable to print anything.',
        status: 'closed',
        timestamp: DateTime.now().subtract(Duration(days: 5)),
      ),
      Ticket(
        subject: 'Computer is slow',
        description: 'My computer is taking too long to start up.',
        status: 'open',
        timestamp: DateTime.now().subtract(Duration(days: 7)),
      ),
      Ticket(
        subject: 'Application not responding',
        description: 'I am unable to use the application.',
        status: 'open',
        timestamp: DateTime.now().subtract(Duration(days: 10)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ticketList = getDummyTicketList();
    return Scaffold(
      appBar: BaseAppBar(),
      body: ListView.builder(
        itemCount: ticketList.length,
        itemBuilder: (context, index) {
          final ticket = ticketList[index];

          return ListTile(
            title: Text(ticket.subject),
            subtitle: Text(ticket.description),
            trailing: Text(ticket.status),
            onTap: () {
              // TODO: Navigate to ticket details screen
              print('Tapped on ticket: $ticket');
            },
          );
        },
      ),
    );
  }
}
