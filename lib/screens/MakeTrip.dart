import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geek_travel/components/custom_helpr.dart';
import 'package:geek_travel/screens/HotelPage.dart';
import 'package:geek_travel/service/apis.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Models/TripModel.dart';
import 'package:intl/intl.dart';
import '../components/Custom_navDrawer.dart';

// Create a secure storage instance
final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

class Maketrip extends StatefulWidget {
  const Maketrip({super.key});

  @override
  State<Maketrip> createState() => _MaketripState();
}

class _MaketripState extends State<Maketrip> {
  DateTime? _selectedArrivalDate;
  DateTime? _selectedDepartureDate;
  final TextEditingController _arrivalController = TextEditingController();
  final TextEditingController _departureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  CalendarFormat _calendarFormat = CalendarFormat
      .month; // Keep track of calendar format

  List<TripModel> _tripList = []; // List to hold the trip models

  @override
  void initState() {
    super.initState();
    _loadTrips(); // Load existing trips when the page initializes
  }

  // Load existing trips from secure storage
  Future<void> _loadTrips() async {
    String? storedTrips = await _secureStorage.read(key: "trip");

    if (storedTrips != null) {
      List<dynamic> tripData = jsonDecode(storedTrips);
      setState(() {
        _tripList = tripData.map((e) => TripModel.fromJson(e)).toList();
      });
    }
  }

  // Save the updated trip list to secure storage
  Future<void> _saveTrip(TripModel trip) async {
    _tripList.add(trip); // Add the new trip to the list
    List<Map<String, dynamic>> tripData = _tripList.map((e) => e.toJson())
        .toList();
    await _secureStorage.write(key: "trip", value: jsonEncode(tripData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Your Trip'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: CustomNavDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Calendar for Arrival Date
                const Text(
                  'Select Date of Arrival:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2100, 12, 31),
                  focusedDay: DateTime.now(),
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) =>
                      isSameDay(_selectedArrivalDate, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedArrivalDate = selectedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Calendar for Departure Date
                const Text(
                  'Select Date of Departure:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2100, 12, 31),
                  focusedDay: DateTime.now(),
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) =>
                      isSameDay(_selectedDepartureDate, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDepartureDate = selectedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Text box for Place of Arrival
                TextFormField(
                  controller: _arrivalController,
                  decoration: const InputDecoration(
                    labelText: "Place of Arrival",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a place of arrival';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Text box for Place of Departure
                TextFormField(
                  controller: _departureController,
                  decoration: const InputDecoration(
                    labelText: "Place of Departure",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a place of departure';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Button to search for flights
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedArrivalDate == null ||
                          _selectedDepartureDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select both arrival and departure dates'),
                          ),
                        );
                      } else {
                        // Save the trip data
                        // TripModel newTrip = TripModel(
                        //   name: "My Trip",
                        //   date: DateFormat('yyyy-MM-dd').format(
                        //       _selectedArrivalDate!),
                        //   flight: "Selected Flight",
                        //   hotel: "null",
                        //   url: 'https://tse2.mm.bing.net/th?id=OIP.bFj7PCgQ3hHqcmeNqKUqlgHaFj&pid=Api&P=0&h=180',
                        //   price: '\$4400',
                        // );
                        //
                        // _saveTrip(newTrip); // Save trip to secure storage
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Search Flights",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 16),

                // Button to search for hotels
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedArrivalDate == null ||
                          _selectedDepartureDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select both arrival and departure dates'),
                          ),
                        );
                      } else {
                        bool kk = logDates();
                        if(kk == true){
                          String formattedArrivalDate = DateFormat('yyyy-MM-dd').format(_selectedArrivalDate!);
                          String formattedDepartureDate = DateFormat('yyyy-MM-dd').format(_selectedDepartureDate!);
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Hotelpage(acity: _arrivalController.text.toString(), arrial: formattedArrivalDate, depart: formattedDepartureDate, dcity: _departureController.text.toString())));
                        }else{
                          Dialogs.showSnackbar(context, "Select Arrival and Departure Date");
                        }
                        // Save the trip data (assuming flight search has completed)

                        // TripModel updatedTrip = TripModel(
                        //   name: "My Trip",
                        //   date: DateFormat('yyyy-MM-dd').format(
                        //       _selectedArrivalDate!),
                        //   flight: "Selected Flight",
                        //   hotel: APIs.hotelname,
                        //   url: 'https://tse2.mm.bing.net/th?id=OIP.bFj7PCgQ3hHqcmeNqKUqlgHaFj&pid=Api&P=0&h=180',
                        //   price: '\$ ${APIs.hotelprice}',
                        // );
                        //
                        // _saveTrip(updatedTrip); // Save the updated trip
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Search Hotels",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 16),

                // Update My Trip Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedArrivalDate == null || _selectedDepartureDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select both arrival and departure dates'),
                          ),
                        );
                      } else if (APIs.hotelprice.isEmpty || APIs.hotelname.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select both hotel and price'),
                          ),
                        );
                      } else {
                        // Save the trip data
                        TripModel newTrip = TripModel(
                          name: "My Trip",
                          date: DateFormat('yyyy-MM-dd').format(_selectedArrivalDate!),
                          flight: "Flight 911",
                          hotel: APIs.hotelname,
                          url: 'https://tse2.mm.bing.net/th?id=OIP.bFj7PCgQ3hHqcmeNqKUqlgHaFj&pid=Api&P=0&h=180',
                          price: '\$ ${APIs.hotelprice}',
                        );

                        _saveTrip(newTrip); // Save the trip to secure storage
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Trip updated successfully!')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Update My Trip",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
                ,
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool logDates() {
    int pp = 0;
    if (_selectedArrivalDate != null) {
      String formattedArrivalDate = DateFormat('yyyy-MM-dd').format(_selectedArrivalDate!);
      print("Arrival Date: $formattedArrivalDate");
      pp++;
    }

    if (_selectedDepartureDate != null) {
      String formattedDepartureDate = DateFormat('yyyy-MM-dd').format(_selectedDepartureDate!);
      print("Departure Date: $formattedDepartureDate");
      pp++;
    }

    return pp==2;
  }
}