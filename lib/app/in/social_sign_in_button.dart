import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';
/*
Class used to create sign in buttons that are associated with social media
 */
class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName, //The location of the picture that is desired
    @required String text, //Text on button, "@required" is used to indicate that this field must be provided in order to be able to run the code
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : assert(assetName!=null),
        assert(text!=null),
        super(
            child: Row( //we wrapped the picture and the text with a "row" widget to enable the option of adding a logo beside the text in the button
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //adds equal space between items in a row widget
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15.0),
              ),
              Opacity(opacity: 0.0, child: Image.asset(assetName)), //HACK: we added the same image after the text and wrapped with Opacity widget to make it invisible,
              // This was done to help us put the logo in the far left of the button, and the text in the middle of the button
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
