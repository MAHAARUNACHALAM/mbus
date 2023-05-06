import 'package:flutter/material.dart';
import 'package:mbus/components/appbar.dart';

import '../../components/button_style.dart';

class Ticket {
  final String subject;
  final String description;
  final String status;
  final DateTime timestamp;

  Ticket({
    required this.subject,
    required this.description,
    required this.status,
    required this.timestamp,
  });
}

class TicketRaisingScreen extends StatefulWidget {
  const TicketRaisingScreen({Key? key}) : super(key: key);

  @override
  _TicketRaisingScreenState createState() => _TicketRaisingScreenState();
}

class _TicketRaisingScreenState extends State<TicketRaisingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTicket() async {
    if (_formKey.currentState!.validate()) {
      final ticketData = Ticket(
        subject: _subjectController.text,
        description: _descriptionController.text,
        status: 'open',
        timestamp: DateTime.now(),
      );

      // TODO: Add the ticket data to your backend system
      print('Submitting ticket data: $ticketData');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ticket raised successfully'),
          backgroundColor: Colors.green,
        ),
      );
      _subjectController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    hintText: 'Enter ticket subject',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ticket subject';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter ticket description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ticket description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: _submitTicket,
                  child: Text('Raise Ticket'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
