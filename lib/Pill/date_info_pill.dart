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
      width: 56,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayLabel,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'SFProRounded',
              height: 1.0,
            ),
          ),
          SizedBox(height: 2),
          Text(
            dayNumber,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontFamily: 'SFProRounded',
              height: 1.0,
            ),
          ),
          SizedBox(height: 2),
          Text(
            monthLabel,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'SFProRounded',
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
