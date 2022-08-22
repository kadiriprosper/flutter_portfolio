import 'package:flutter/material.dart';

class IconRowButton extends StatelessWidget {
  const IconRowButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.iconColor,
    required this.tasksLength,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final void Function() onTap;
  final Color iconColor;
  final int tasksLength;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      splashColor: Colors.lightBlueAccent.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                textAlign: TextAlign.start,
              ),
            ]),
          ),
          SizedBox(
            child: Text(tasksLength.toString()),
          )
        ],
      ),
    );
  }
}
