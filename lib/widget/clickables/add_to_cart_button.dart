import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class AddToCartButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  // final bool inProgress = false;
  final Color btnColor = mainColor;
  final Color txtColor = onPrimaryLight;
  final Widget? nextpage;
  const AddToCartButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.nextpage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getsize(context).width * 0.5,
      height: getsize(context).height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          if (nextpage != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextpage!));
          } else {
            if (kDebugMode) {
              print("not pressed");
            }
          }
          ;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: onPrimaryLight,
                fontSize: 18,
                fontFamily: "cairo",
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.shopping_cart,
              color: onPrimaryLight,
            ),
          ],
        ),
      ),
    );
  }
}
