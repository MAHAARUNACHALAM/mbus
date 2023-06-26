import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mbus/providers/hexColor.dart';
import 'package:mbus/screens/client/busListScreen.dart';

import '../../components/dropdown_button.dart';
import '../../config/app_config.dart';

class Home extends StatefulWidget {
  List cityList = [
    {'name': 'Trichy', 'code': 'TPJ'},
    {'name': 'Tambaram', 'code': 'TBM'},
    {'name': 'Tirunelveli', 'code': 'TEN'},
  ];
  String source = "default";
  String destination = "default";
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DropdownMenuItem<String>> getcityDropdownItems() {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
          child: Text(
            "Select City",
          ),
          value: "default"),
    ];

    for (Map city in widget.cityList) {
      if (city['name'] != null)
        items.add(
          DropdownMenuItem(
            value: city["code"],
            child: Text(
              city["name"],
            ),
          ),
        );
    }
    return items;
  }

  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = DateFormat('dd/MM/yyyy').format(DateTime.now());

    super.initState();
  }

  bool validator() {
    //either of widget.source,destination,dateInput.text is null or default then return false
    if (widget.source == "default" ||
        widget.destination == "default" ||
        dateInput.text == null ||
        dateInput.text == "default") {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chennai to Trichy',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Starting from Rs. 500',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to bus listing screen
                        },
                        child: Text('Book Now'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(25, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: hexYellow),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Trichy to Madurai',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Starting from Rs. 400',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to bus listing screen
                        },
                        child: Text('Book Now'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(25, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: hexYellow),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Find Your Bus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropdownButton(
              value: widget.source,
              items: getcityDropdownItems(),
              onChanged: (value) {
                setState(() {
                  if (value == widget.destination) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Source and destination Can't be same"),
                    ));
                  } else {
                    setState(() {
                      widget.source = value!;
                    });
                  }
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropdownButton(
                value: widget.destination,
                items: getcityDropdownItems(),
                onChanged: (value) {
                  //if value is equal to source then raise scafaold
                  if (value == widget.source) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Source and destination Can't be same"),
                    ));
                  } else {
                    setState(() {
                      widget.destination = value!;
                    });
                  }
                }),
          ),

          //add date picker
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 3),
            child: TextFormField(
              controller: dateInput,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              //editing controller of this TextField
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.calendar_today),
                  fillColor: Color.fromARGB(255, 235, 231, 231),
                  filled: true //icon of text field
                  // labelText: "Enter Date" //label text of field
                  ),

              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    // firstDate is previous day
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 100)),

                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(DateTime.now().year + 1),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                            textTheme: TextTheme(
                              button: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            colorScheme: const ColorScheme.light(
                              onPrimary: Colors.black, // selected text color
                              onSurface: Colors.black,
                              // default text color
                              primary: Colors.orange,

                              // circle color
                            ),
                            dialogBackgroundColor: Colors.white,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand'),
                                    // color of button's letters
                                    backgroundColor:
                                        Colors.yellowAccent, // Background color
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.orange,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(50))))),
                        child: child!,
                      );
                    });
                if (pickedDate != null) {
                  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);

                  //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                  print(dateInput.text);
                } else {}
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () async {
                // Navigate to bus listing screen
                if (validator()) {
                  //dio call to get bus list
                  var response = await Dio()
                      .post(config!.apiBaseUrl + 'api/Bus/getBus', data: {
                    "source": widget.source,
                    "destination": widget.destination,
                    "date": dateInput.text
                  });

                  List<dynamic> buses = response.data;

                  List<Bus> busList = [];
                  for (var bus in buses) {
                    busList.add(Bus.fromJson(bus));
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusListScreen(
                                busList: busList,
                              )));
                } else
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please fill all the fields"),
                  ));
              },
              child: Text('Search Buses'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: hexYellow),
            ),
          ),
        ],
      ),
    );
  }
}
