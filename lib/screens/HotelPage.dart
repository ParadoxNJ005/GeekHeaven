import 'package:flutter/material.dart';
import 'package:geek_travel/Models/TripModel.dart';
import 'package:geek_travel/components/custom_helpr.dart';

import '../Models/HotelModel.dart';
import '../service/apis.dart';
import '../utils/constants.dart';

class Hotelpage extends StatefulWidget {
  final String acity;
  final String arrial;
  final String depart;
  final String dcity;
  const Hotelpage({super.key, required this.acity, required this.arrial, required this.depart, required this.dcity});

  @override
  State<Hotelpage> createState() => _HotelpageState();
}

class _HotelpageState extends State<Hotelpage> {
  late Future<Example?> hotelsFuture;

  @override
  void initState() {
    super.initState();
    hotelsFuture =
        APIs.fetchHotelFinal(widget.acity, widget.depart, widget.arrial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotels in ${widget.acity}"),
      ),
      body: FutureBuilder<Example?>(
        future: hotelsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else
          if (!snapshot.hasData || snapshot.data?.data?.data?.isEmpty == true) {
            return const Center(child: Text('No hotels found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data?.data?.length,
              itemBuilder: (context, index) {
                var hotel = snapshot.data!.data!.data?[index];
                return Card(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                            "${hotel!.title}   ${hotel.bubbleRating?.rating}" , style: TextStyle(fontSize: 15),),
                        subtitle: Text("${hotel.secondaryInfo}"),
                        trailing: Text("${hotel.priceForDisplay}" , style: TextStyle(fontSize: 15),),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Dialogs.showSnackbar(context, ("Booked : ${hotel.title}"));
                          APIs.hotelname = hotel.title!;
                          APIs.hotelprice = hotel.priceForDisplay;
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 45), // Set width to double.infinity and height to 30
                          backgroundColor: Colors.blue, // Set background color to blue
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Corner radius of 10
                          ),
                        ),
                        child: const Text(
                          "Book Hotel Now",
                          style: TextStyle(
                              color: Colors.white, // Text color white
                              fontSize: 20,
                              fontWeight: FontWeight.bold// Font size 20
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
