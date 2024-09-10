import 'package:flutter/material.dart';
import 'package:geek_travel/screens/travelList.dart';

import '../components/Custom_navDrawer.dart';

class Maintravelscreen extends StatefulWidget {
  const Maintravelscreen({super.key});

  @override
  State<Maintravelscreen> createState() => _MaintravelscreenState();
}

class _MaintravelscreenState extends State<Maintravelscreen> {
  // late Future<UpcomingMovieModel> upcomingFuture;
  // late Future<UpcomingMovieModel> nowPlayingFuture;
  // late Future<TvSeriesModel> topRatedShows;

  // ApiServices apiServices = ApiServices();

  void initState() {
    super.initState();
    // upcomingFuture = apiServices.getUpcomingMovies();
    // nowPlayingFuture = apiServices.getNowPlayingMovies();
    // topRatedShows = apiServices.getTopRatedSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Geek_Travels" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25),),
          leading: IconButton(
            icon: Icon(Icons.density_medium ,color: Colors.white, size: 30,),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 25,
                width: 25,
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        drawer: CustomNavDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Show the dialog when the button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogTravalList();
              },
            );
          },
          child: const Icon(Icons.add),
          tooltip: 'Open Travel Checklist',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // FutureBuilder<TvSeriesModel>(
              //   future: topRatedShows,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return CustomCarouselSlider(data: snapshot.data!);
              //     }
              //     return const SizedBox();
              //   },
              // ),
              SizedBox(
                height: 220,
                // child: MovieCardWidget(
                //     future: nowPlayingFuture,
                //     headLineText: "now playing movies"),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 220,
                // child: MovieCardWidget(
                //     future: upcomingFuture, headLineText: "Upcoming Movies"),
              ),
            ],
          ),
        ));
  }
}
