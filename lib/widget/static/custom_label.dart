import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final Color labelColor = mainColor;
  const CustomLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                color: onPrimaryLight,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: "cairo"),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
