import 'package:flutter/material.dart'; //importing materials that will be used to build the app
import 'package:time_tracker_flutter_course/app/in/landing_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

void main() {
  //Entry point of the application
  runApp(MyApp()); //"MyApp" is just a given name that is optional
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //material design
      title: 'Time Tracker',
      theme: ThemeData(
          primarySwatch:
              Colors.indigo //identify the primary color of the entire app
          ),
      home: LandingPage(
        auth: Auth(),
      ), //Home page for the app
    );
  }
}
