import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/in/home/home_page.dart';
import 'package:time_tracker_flutter_course/app/in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class LandingPage extends StatelessWidget {
  //The page used to decide whether the user should sign_in or go to home page
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              //if the user had no user id, go to sign in page
              return SignInPage.create(context);
            }
            return Provider<Database>(
              // ignore: deprecated_member_use
              builder: (_) => FirestoreDatabase(uid: user.uid),
              child: HomePage(), //if user had id (signed in), go to home page
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
