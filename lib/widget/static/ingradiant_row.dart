import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class IngradiantsRow extends StatefulWidget {
  final bool isChecked = false;
  final String ingradiants;
  final String ingimage;
  const IngradiantsRow({
    super.key,
    required this.ingradiants,
    required this.ingimage,
  });

  @override
  State<IngradiantsRow> createState() => _IngradiantsRowState();
}

class _IngradiantsRowState extends State<IngradiantsRow> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Image.asset(
              //   widget.ingimage,
              //   width: 70,
              //   height: 60,
              // ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.ingradiants,
                style: bold16,
              ),
            ],
          ),
          Checkbox(
            activeColor: mainColor,
            checkColor: onPrimaryLight,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          )
        ],
      ),
    );
  }
}
