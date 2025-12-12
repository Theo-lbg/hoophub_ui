import 'package:flutter/material.dart';

class DateInfoPill extends StatelessWidget {
  final String dayLabel; // e.g. "mar"
  final String dayNumber; // e.g. "2"
  final String monthLabel; // e.g. "Déc"
  final Color backgroundColor;
  final Color textColor;

  const DateInfoPill({
    super.key,
    required this.dayLabel,
    required this.dayNumber,
    required this.monthLabel,
    this.backgroundColor = const Color(0xFF4956C6),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 115,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayLabel,
            style: TextStyle(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Rounded',
              height: 0.9,
            ),
          ),
          SizedBox(height: 3),
          Text(
            dayNumber,
            style: TextStyle(
              color: textColor,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Rounded',
              height: 0.9,
            ),
          ),
          SizedBox(height: 3),

          Text(
            monthLabel,
            style: TextStyle(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Rounded',
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
