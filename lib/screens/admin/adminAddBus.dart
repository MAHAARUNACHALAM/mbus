import 'package:flutter/material.dart';
import 'package:mbus/components/button_style.dart';

class AddBus extends StatefulWidget {
  const AddBus({Key? key}) : super(key: key);

  @override
  _AddBusState createState() => _AddBusState();
}

class _AddBusState extends State<AddBus> {
  final _formKey = GlobalKey<FormState>();
  final _busNameController = TextEditingController();
  final _busNumberController = TextEditingController();
  final _busRoute_FromController = TextEditingController();
  final _busRoute_ToController = TextEditingController();
  final _totalSeatsController = TextEditingController();
  final _ticketPriceController = TextEditingController();
  String? _busTypeValue;

  @override
  void dispose() {
    _busNameController.dispose();
    _busNumberController.dispose();
    _busRoute_FromController.dispose();
    _busRoute_ToController.dispose();
    _totalSeatsController.dispose();
    _ticketPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                controller: _busNameController,
                decoration: InputDecoration(
                  labelText: 'Bus Name',
                  hintText: 'Enter bus name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bus name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _busNumberController,
                decoration: InputDecoration(
                  labelText: 'Bus Number',
                  hintText: 'Enter bus number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bus number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _busRoute_FromController,
                decoration: InputDecoration(
                  labelText: 'From',
                  hintText: 'Enter bus route',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bus route';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _busRoute_ToController,
                decoration: InputDecoration(
                  labelText: 'To',
                  hintText: 'Enter bus route',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bus route';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _totalSeatsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Total Seats',
                  hintText: 'Enter total seats',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total seats';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _ticketPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ticket Price',
                  hintText: 'Enter ticket price',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ticket price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              DropdownButton(
                value: _busTypeValue,
                hint: Text('Select Bus Type'),
                items: [
                  DropdownMenuItem(
                    child: Text('AC'),
                    value: 'AC',
                  ),
                  DropdownMenuItem(
                    child: Text('Non-AC'),
                    value: 'Non-AC',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _busTypeValue = value as String?;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
// Save bus to database
// Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Bus added successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Text('Add Bus'),
                style: buttonStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
