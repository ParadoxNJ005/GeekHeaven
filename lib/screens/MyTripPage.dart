import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/TripModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../components/Custom_navDrawer.dart';

class Mytrippage extends StatefulWidget {
  const Mytrippage({super.key});

  @override
  State<Mytrippage> createState() => _MytrippageState();
}

class _MytrippageState extends State<Mytrippage> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  List<TripModel> _tripList = [];
  List<bool> _selectedTrips = []; // List to track checked state

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  Future<void> _loadTrips() async {
    String? tripData = await _storage.read(key: "trip");
    if (tripData != null) {
      List<dynamic> jsonData = jsonDecode(tripData);
      setState(() {
        _tripList = jsonData.map((item) => TripModel.fromJson(item)).toList();
        _selectedTrips = List<bool>.filled(_tripList.length, false); // Initialize checkbox states
      });
    }
  }

  Future<void> _deleteSelectedTrips() async {
    List<TripModel> updatedTrips = [];
    List<bool> updatedSelectedTrips = [];
    for (int i = 0; i < _tripList.length; i++) {
      if (!_selectedTrips[i]) {
        updatedTrips.add(_tripList[i]);
        updatedSelectedTrips.add(false);
      }
    }

    setState(() {
      _tripList = updatedTrips;
      _selectedTrips = updatedSelectedTrips; // Update to match the new length
    });

    // Save updated trips list to storage
    await _storage.write(key: "trip", value: jsonEncode(_tripList.map((e) => e.toJson()).toList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trip History'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteSelectedTrips,
            tooltip: 'Delete Selected',
          ),
        ],
      ),
      drawer: CustomNavDrawer(),
      body: _tripList.isEmpty
          ? const Center(
        child: Text(
          "No data",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: _tripList.length,
        itemBuilder: (context, index) {
          if (index >= _selectedTrips.length) {
            return const SizedBox.shrink(); // Avoid building widgets if index is out of bounds
          }

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _tripList[index].name ?? "Unknown Trip",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (_tripList[index].url != null)
                          CachedNetworkImage(
                            imageUrl: _tripList[index].url!,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        const SizedBox(height: 10),
                        Text("Date: ${_tripList[index].date}"),
                        Text("Flight: ${_tripList[index].flight}"),
                        Text("Hotel: ${_tripList[index].hotel}"),
                        Text("Price: ${_tripList[index].price}"),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: _selectedTrips[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedTrips[index] = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
