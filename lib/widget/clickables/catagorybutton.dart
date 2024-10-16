import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class CategoryButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final bool isSlected;

  const CategoryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSlected,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        width: getsize(context).width * 0.5,
        height: getsize(context).height * 0.06,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isSlected ? mainColor : tertiaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            return widget.onPressed();
          },
          child: Text(
            widget.text,
            style: const TextStyle(
              color: onPrimaryLight,
              fontSize: 18,
              fontFamily: "Cairo",
            ),
          ),
        ),
      ),
    );
  }
}
