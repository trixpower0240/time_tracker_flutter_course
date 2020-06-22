import 'package:flutter/material.dart';

/*
Class that is used to construct buttons
 */
class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 2.0, //aka edge radius
    this.height: 50.0, //height of the button
    this.onPressed,
  }) : assert(borderRadius !=
            null); //ensures that the radius of the edges on the button is a legit value

  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        //Just a button
        child: child,
        //text that appears on the button
        color: color,
        disabledColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed, //Call back method for when the button is pressed
      ),
    );
  }
}
