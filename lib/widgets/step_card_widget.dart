import 'package:flutter/material.dart';

class StepCardWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double fontSize;

  const StepCardWidget({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // Shadow position
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}