import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/widget/card/spiacial_card.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/progress_bar_order.dart';
import 'package:provider/provider.dart';

class SpiacialOrderScreen extends StatefulWidget {
  const SpiacialOrderScreen({super.key});

  @override
  State<SpiacialOrderScreen> createState() => _SpiacialOrderScreenState();
}

class _SpiacialOrderScreenState extends State<SpiacialOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MealsProvider>(builder: (context, mealsProvider, _) {
      return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("طلب مناسبه"),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getsize(context).width * 0.95,
                        height: 20,
                        decoration: BoxDecoration(
                          color: tertiaryDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  Text("1/5 بوكس التذوق"),
                  SizedBox(height: 20),
                  Text("اختر اصناف بوكس التذوق"),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: mealsProvider.meals.length,
                    itemBuilder: (context, index) {
                      return SpiacialCard(
                        meal: mealsProvider.meals[index],
                        mealName: mealsProvider.meals[index].mealName,
                        imageUrl: mealsProvider.meals[index].imageUrl,
                        kitchenName: mealsProvider.meals[index].kitchenName,
                        rating: mealsProvider.meals[index].rating,
                        price: mealsProvider.meals[index].price,
                      );
                    },
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 3,
                      offset: Offset(0, 6),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                    ),
                    Text(
                      " التالي",
                      style: bold16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
