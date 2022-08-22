import 'package:flutter/material.dart';
import 'package:tip_me/constants/constants.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      required this.label,
      required this.controller,
      required this.side})
      : super(key: key);

  final String hintText;
  final String side;
  final void Function(String? value) onChanged;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(28),
        margin: side == 'left'
            ? const EdgeInsets.only(right: 10)
            : const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: side == 'left'
              ? const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10))
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label,
              style: textStyle1,
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              onChanged: onChanged,
              style: textStyle1.copyWith(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textStyle1.copyWith(fontSize: 16),
                border: textInputDecoration,
                enabledBorder: textInputDecoration,
                disabledBorder: textInputDecoration.copyWith(
                  borderSide: const BorderSide(color: Colors.white, width: .5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
