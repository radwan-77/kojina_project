import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class CustomLabel extends StatelessWidget {
  final String? clickhere;
  final String text;
  final Color labelColor = mainColor;
  final double Sizefont;
  const CustomLabel({
    super.key,
    required this.text,
    this.clickhere,
    this.Sizefont = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 16, left: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: bold15,
          ),
          if (clickhere != null)
            TextButton(
              onPressed: () {},
              child: Text(
                clickhere!,
                style: normal12,

              ),
            )
        ],
      ),
    );
  }
}
