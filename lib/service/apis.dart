import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../Models/FlightModel.dart';
import '../Models/WeatherModel.dart';

class APIs {

  //---------------------------------------------Weather Api--------------------------------------------------------------//
  //https://api.openweathermap.org/data/2.5/weather?q=russia&APPID=cd2e34eee5dbf80c8197c24f3701fd7a

  //-----------------------------------Constants(base url and apikey)-----------------------------------------------//
  static final String baseUrl = "https://api.openweathermap.org/data/2.5/";
  static final String apiKey = "cd2e34eee5dbf80c8197c24f3701fd7a";
  //--------------------------------------------------------------------------------------------//

  //----------------------------------fetch the api--------------------------------------------//
  static Future<Wea> fetch(String city) async {
    final String url =
        baseUrl + "weather?q=${city}&units=metric&APPID=${apiKey}";
    log("$url");

    final response = await http.get(Uri.parse(url));
    log(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data =
      Wea.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      // log("Success : ${response.body}");
      return data;
    } else {
      log(response.body);
      throw Exception('Failed to load weather data');
    }
  }
  //------------------------------------------------------------------------------------------//

  //--------------------------convert timestamp ot hh:mm format---------------------------------//
  static String formatTimestamp(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    DateFormat formatter = DateFormat('hh:mm a');
    String formattedTime = formatter.format(dateTime);

    return formattedTime;
  }
  //------------------------------------------------------------------------------------------//

  //--------------------------convert timestamp to day of week format---------------------------//
  static String formatDayOfWeek(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    DateFormat formatter = DateFormat('EEEE');
    String dayOfWeek = formatter.format(dateTime);

    return dayOfWeek;
  }
  //-----------------------------------------------------------------------------------------//

  //---------------------------------Convert timestamp to dd mmmm yyyy format----------------------------//
  static String formatDate(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    DateFormat formatter = DateFormat('dd MMMM yyyy');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
  //-----------------------------------------------------------------------------------------------------//

  //--------------------------------------------Weather API OVER--------------------------------------------------------------------//


  Future<FlightModelDart?> fetchFlights(String src , String des , ) async {
    final url = Uri.parse('https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights?sourceAirportCode=BOM&destinationAirportCode=DEL&itineraryType=ONE_WAY&sortOrder=ML_BEST_VALUE&numAdults=1&numSeniors=0&classOfService=ECONOMY&pageNumber=1&nearby=yes&nonstop=yes&currencyCode=USD&region=USA');

    try {
      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-key': '51bb281ac6msh115521ff50f3357p1d5628jsn7a804446840d',
          'x-rapidapi-host': 'tripadvisor16.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        // Convert the JSON response into a FlightModelDart object
        final Map<String, dynamic> jsonData = json.decode(response.body);
        FlightModelDart flightData = FlightModelDart.fromJson(jsonData);
        return flightData;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  //-----------------------------------Snackbar-----------------------------------------------------//
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          msg,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red.withOpacity(.8),
        behavior: SnackBarBehavior.floating));
  }
//-------------------------------------------------------------------------------------------------//
}
