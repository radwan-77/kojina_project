
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class ForGetPassword extends StatefulWidget {
  final String text1;
  final String text2;
  final Color text1color = tertiaryDark;
  final Color text2color = mainColor;
  final Function onPressed;
  final Widget nextpage;
  const ForGetPassword(
      {super.key,
      required this.text1,
      required this.text2,
      required this.nextpage, required this.onPressed});

  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text1,
          style: TextStyle(
            color: widget.text1color,
            fontSize: 14,
            fontFamily: "cairo",
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onPressed();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => widget.nextpage));
          },
          child: Text(
            widget.text2,
            style: TextStyle(
              color: widget.text2color,
              fontSize: 14,
              fontFamily: "cairo",
            ),
          ),
        ),
      ],
    );
  }
}
