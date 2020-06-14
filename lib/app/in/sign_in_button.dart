import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';
/*
Class used to construct sign in buttons that are not associated with social media
takes some parameters, and has some default values
 */
class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text, //"@required" indicates that this parameter is required, and complains if not provided
    Color color, //Color of the button
    Color textColor,
    VoidCallback onPressed, //action performed when button is pressed
  }) : assert(text!=null), //ensures that the text on the button is not null, otherwise, complains
        super( //uses the super class "CustomRaisedButton" constructor to initiate values
          child: Text(
            text, //the text parameter passed in
            style: TextStyle(color: textColor, fontSize: 15.0), //textColor parameter, and a default font size of 15 points
          ),
          color: color, //Button's color parameter
          onPressed: onPressed, //action to be done parameter
        );
}
