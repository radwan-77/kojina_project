import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class ProgressBarOrder extends StatelessWidget {
  final bool isDone1;
  final bool isDone2;
  final bool isDone3;

  const ProgressBarOrder({
    super.key,
    this.isDone1 = false,
    this.isDone2 = false,
    this.isDone3 = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        // i put it in the end cuz arabic language
        // when do a localizaton do a condition to check the language
        // if it's arabic do a reverse to the list
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: getsize(context).width * 0.29,
            height: 10,
            decoration: BoxDecoration(
              color: isDone1 ? mainColor : tertiaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            width: getsize(context).width * 0.29,
            height: 10,
            decoration: BoxDecoration(
              color: isDone2 ? mainColor : tertiaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            width: getsize(context).width * 0.29,
            height: 10,
            decoration: BoxDecoration(
              color: isDone3 ? mainColor : tertiaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
