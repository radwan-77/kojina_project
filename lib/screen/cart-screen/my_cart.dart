import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/widget/clickables/add_to_cart_button.dart';
import 'package:kojina_project/widget/static/meal_row_ingraidantes.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  int conter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating action button from meal screen
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: getsize(context).width * 0.9,
              height: getsize(context).height * 0.2,
              decoration: BoxDecoration(
                color: tertiaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MealRowWidget(
                  imageUrl: "assets/meal1.png",
                  mealName: " وجبه العرجيعة",
                  kitchenName: " جيميرا",
                  price: 20),
            ),
            Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: AddToCartButton(text: "text", onPressed: () {}))
          ],
        ),
      ),
    );
  }
}

