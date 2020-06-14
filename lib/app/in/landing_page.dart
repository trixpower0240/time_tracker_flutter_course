import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/in/home_page.dart';
import 'package:time_tracker_flutter_course/app/in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatelessWidget {
  //The page used to decide whether the user should sign_in or go to home page
  LandingPage({@required this.auth});

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              //if the user had no user id, go to sign in page
              return SignInPage(
                auth: auth,
              );
            }
            return HomePage(
              //if user had id (signed in), go to home page
              auth: auth,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
