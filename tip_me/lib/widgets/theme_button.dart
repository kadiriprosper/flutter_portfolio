import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.onTap,
    required this.bgColor,
    required this.fgColor,
  }) : super(key: key);
  final Color? bgColor;
  final Color? fgColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          maxRadius: 17,
          minRadius: 12,
          backgroundColor: bgColor,
          child: CircleAvatar(
            backgroundColor: fgColor,
            maxRadius: 10,
          ),
        ),
      ),
    );
  }
}
