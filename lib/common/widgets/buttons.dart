import 'package:flutter/material.dart';

class Buttons {
  Widget circularElevatedButton({
    required double height,
    required double width,
    required VoidCallback onPressed,
    required Color buttonBG,
    required String buttonText,
    required Color buttonTextColor,
    required double buttonTextSize,
    double borderRadius = 30.0, // default circular radius
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBG,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor,
            fontSize: buttonTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
