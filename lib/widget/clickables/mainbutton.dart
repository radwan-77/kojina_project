import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  // final bool inProgress = false;
  final Color btnColor = mainColor;
  final Color txtColor = onPrimaryLight;
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getsize(context).width * 0.9,
      height: getsize(context).height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            color: onPrimaryLight,
            fontSize: 18,
            fontFamily: "cairo",
          ),
        ),
      ),
    );
  }
}
