import 'package:flutter/material.dart';

class InfoPill extends StatelessWidget {
  final String label;
  final double size;
  final Color backgroundColor;
  final Color labelColor;
  final Widget? icon;

  const InfoPill({
    super.key,
    this.label = 'Info Pill',
    this.size = 10.0,
    this.backgroundColor = Colors.blue,
    this.labelColor = Colors.white,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            SizedBox(
              width: size,
              height: size,
              child: IconTheme(
                data: IconThemeData(color: labelColor, size: size),
                child: icon!,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label.toUpperCase(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: size,
              color: labelColor,
              fontFamily: 'SFProRounded',
            ),
          ),
        ],
      ),
    );
  }
}
