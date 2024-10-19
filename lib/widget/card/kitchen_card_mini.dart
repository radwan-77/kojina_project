import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class kitchencardmini extends StatelessWidget {
  final String mainimage;
  final String miniimage;
  const kitchencardmini({
    super.key,
    required this.mainimage,
    required this.miniimage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 25, left: 25, top: 25),
          width: getsize(context).width,
          height: getsize(context).height * 0.2,
          decoration: BoxDecoration(
            color: tertiaryDark,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(mainimage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          right: 50,
          // how to use Overflow
          child: ClipOval(
            child: Image.asset(
              miniimage,
              width: 100,
              height: 100,
            ),
          ),
        )
      ],
    );
  }
}
