import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.auth});

  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    //always use future for async (marks asynchronous methods) operations
    try {
      await auth
          .signInAnonymously(); //use await to suspend execution until future return a value
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    //always use future for async (marks asynchronous methods) operations
    try {
      await auth
          .signInWithGoogle(); //use await to suspend execution until future return a value
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) async {
    Navigator.of(context).push(
      //widget used to perform navigation,
      //opens a navigation stack (push and pop).
      // Pushes a new route on our home page, then we use a pop method to get back to home
      MaterialPageRoute<void>(
        //a route that will be pushed and will be used as the email sign in page
        fullscreenDialog: true,
        //A method used to specify how the new route screen will be introduced (Entrance effects)
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //Centers the  text following
        title: Text('Time Tracker'), //Title widget for our sign in page
        elevation: 2.0, //shadow under the head bar
      ),
      body: _buildContent(context),
      backgroundColor:
          Colors.grey[200], //background color -> grey with shade of 200
    );
  }

  Widget _buildContent(BuildContext context) {
    //body of the scaffold/page
    return Padding(
      padding: EdgeInsets.all(16.0),
      //This insets the container by 16 points in all directions
      child: Column(
        //a widget child that can be of any type
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //used for aligning things horizontally in a column
        children: <Widget>[
          //a list of children widgets that share similar properties
          Text(
            'Sign in', //main page text
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48.0),
          //used for spacing between buttons and the "sign in" text
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            //google logo, from root files, we added a folder named images
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            //hex value for a dark navy color (very hot color)
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }

  void signInWithGoogle() {
    //Later, add google sign in settings
  }
}
