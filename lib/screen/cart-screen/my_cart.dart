import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/widget/clickables/add_to_cart_button.dart';
import 'package:kojina_project/widget/static/meal_row_ingraidantes.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: getsize(context).width * 0.87,
                decoration: BoxDecoration(
                  color: cartColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/jomira_mini.png",
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    Text("اسم المطعم", style: bold20),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    MealRowWidget(
                        imageUrl: "assets/meal1.png",
                        mealName: "mealName",
                        price: 5),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/alert.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "إذا كنت لست متأكد من الطلب الرجاء \n الضغط على الزر للتأكد من الطلب",
                              style: normal10,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(" الاجمالي", style: bold15),
                            Text("50 د.ل", style: bold15),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AddToCartButton(text: "text", onPressed: () {}),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getsize(context).height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
