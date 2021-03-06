import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/in/email_sign_in_form.dart';
import 'package:time_tracker_flutter_course/app/in/email_sign_in_form_cahnge_notifier.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

import 'email_sign_in_form_bloc_based.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //Centers the  text following
        title: Text('Sign in'), //Title widget for our sign in page
        elevation: 2.0, //shadow under the head bar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormChangeNotifier.create(context),
          ),
        ),
      ),
      backgroundColor:
          Colors.grey[200], //background color -> grey with shade of 200
    );
  }
}
