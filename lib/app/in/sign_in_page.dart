import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/in/sign_in_bloc.dart';
import 'package:time_tracker_flutter_course/app/in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.bloc}) : super(key: key);
  final SignInBloc bloc;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Provider<SignInBloc>(
      // ignore: deprecated_member_use
      builder: (_) => SignInBloc(auth: auth),
      dispose: (context, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (context, bloc, _) => SignInPage(bloc: bloc),
      ),
    );
  }

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    //always use future for async (marks asynchronous methods) operations
    try {
      await bloc
          .signInAnonymously(); //use await to suspend execution until future return a value
    } on PlatformException catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    //always use future for async (marks asynchronous methods) operations
    try {
      await bloc
          .signInWithGoogle(); //use await to suspend execution until future return a value
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
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
        builder: (context) => EmailSignInPage(),
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
      body: StreamBuilder<bool>(
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context, snapshot) {
            return _buildContent(context, snapshot.data);
          }),
      backgroundColor:
          Colors.grey[200], //background color -> grey with shade of 200
    );
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
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
          SizedBox(
            height: 50.0,
            child: _buildHeader(isLoading),
          ),
          SizedBox(height: 48.0),
          //used for spacing between buttons and the "sign in" text
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            //google logo, from root files, we added a folder named images
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            //hex value for a dark navy color (very hot color)
            onPressed: isLoading ? null : () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: isLoading ? null : () => _signInWithEmail(context),
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
            onPressed: isLoading ? null : () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in', //main page text
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
