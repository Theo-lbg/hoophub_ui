import 'package:flutter/material.dart';
import 'colors.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    this.onPressed,
    Color? color,
    Color? fontColor,
    this.buttonHeight,
    this.defaultPressed = false,
    this.icon,
  }) : color = color ?? primary,
       fontColor = fontColor ?? primaryFont;

  factory Button.secondary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? buttonHeight,
    bool defaultPressed = false,
    Widget? icon,
  }) {
    return Button(
      key: key,
      text: text,
      onPressed: onPressed,
      color: secondary,
      buttonHeight: buttonHeight,
      defaultPressed: defaultPressed,
      icon: icon,
    );
  }

  factory Button.tertiary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? buttonHeight,
    bool defaultPressed = false,
    Widget? icon,
  }) {
    return Button(
      key: key,
      text: text,
      onPressed: onPressed,
      color: tertiary,
      fontColor: tertiaryFont,
      buttonHeight: buttonHeight,
      defaultPressed: defaultPressed,
      icon: icon,
    );
  }

  final Color color;
  final String text;
  final Color fontColor;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final bool defaultPressed;
  final Widget? icon;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _pressed = widget.defaultPressed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onButtonDown,
      onTapUp: _onButtonUp,
      onTap: _onButtonPressed,
      child: Transform.translate(
        offset: _pressed ? const Offset(0, 3) : const Offset(0, 0),
        child: Container(
          height: _pressed
              ? (widget.buttonHeight ?? 72) - 6
              : widget.buttonHeight ?? 72,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.onPressed != null ? widget.color : disabled,
            borderRadius: BorderRadius.circular(16),
            border: Border(
              top: BorderSide(color: Colors.black.withAlpha(150), width: 2),
              bottom: BorderSide(
                color: Colors.black.withAlpha(150),
                width: _pressed ? 2 : 8,
              ),
              left: BorderSide(color: Colors.black.withAlpha(150), width: 2),
              right: BorderSide(color: Colors.black.withAlpha(150), width: 2),
            ),
          ),
          child: Center(
            child:
                widget.icon ??
                Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.onPressed != null
                        ? widget.fontColor
                        : Colors.black.withAlpha(150),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro Rounded',
                  ),
                ),
          ),
        ),
      ),
    );
  }

  void _onButtonDown(TapDownDetails details) {
    if (widget.onPressed != null) {
      setState(() {
        _pressed = true;
      });
    }
  }

  void _onButtonUp(TapUpDetails details) {
    if (widget.onPressed != null) {
      setState(() {
        _pressed = false;
      });
    }
  }

  void _onButtonPressed() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }
}
