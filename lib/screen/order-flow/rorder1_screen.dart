import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

import 'package:kojina_project/widget/static/custom_expantion_tile.dart';
import 'package:kojina_project/widget/static/meal_row_ingraidantes.dart';
import 'package:kojina_project/widget/static/progress_bar_order.dart';

class RegularOrderScreen extends StatelessWidget {
  const RegularOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/order_1.png"),
              ),
              const ProgressBarOrder(isDone1: true),
              Text("تم استلام الطلب", style: bold40),
              Text("سيتم توصيل الطلب خلال 30 دقيقة", style: normal15),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "المنزل",
                  ),
                ],
              ),
              const Row(
                children: [
                  Text("العنوان"),
                ],
              ),
              const Row(
                children: [
                  Text("رقم الهاتف"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomExpantionTile(
                expansionTitle: "تفاصيل الطلب",
                childern: [
                  MealRowWidget(
                      imageUrl: "assets/face.png",
                      mealName: "mealName",
                      price: 5),
                  MealRowWidget(
                      imageUrl: "assets/face.png",
                      mealName: "mealName",
                      kitchenName: "kitchenName",
                      price: 5),
                  MealRowWidget(
                      imageUrl: "assets/face.png",
                      mealName: "mealName",
                      kitchenName: "kitchenName",
                      price: 5),
                  MealRowWidget(
                      imageUrl: "assets/face.png",
                      mealName: "mealName",
                      kitchenName: "kitchenName",
                      price: 5),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomExpantionTile(
                expansionTitle: "تفاصيل السائق",
                childern: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, right: 10, left: 10),
                        child: Image.asset("assets/dravier.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("اسم السائق", style: bold15),
                          Text("رقم الهاتف", style: normal12),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/callicon.png",
                        width: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/chaticon.png",
                        width: 50,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
