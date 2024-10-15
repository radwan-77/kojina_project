import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class MainButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  // final bool inProgress = false;
  final Color btnColor = mainColor;
  final Color txtColor = onPrimaryLight;
  final Widget? nextpage;
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
     this.nextpage,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Getsize(context).width * 0.9,
      height: Getsize(context).height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          widget.onPressed();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widget.nextpage!));
        },
        child: Text(
          widget.text,
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
