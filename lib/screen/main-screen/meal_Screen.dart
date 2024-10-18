import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/widget/clickables/add_to_cart_button.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/ingradiant_row.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int intquantity = 1;
//this function will enhace the user experience
// when reach end of the screen ? call add to cart button : null or diaappear
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          AddToCartButton(text: "اضف للسلة", onPressed: () {}),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/meal1.png"),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "وجبة العرجيعة",
                    style: titleStyle,
                  ),
                  Text(
                    "35 دينار ",
                    style: titleStyle,
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "أرز متبل بالتوابل العربية مثل الزعفران والهيل، يُقدم مع قطع لحم مشوي طري (دجاج أو غنم)، بنكهة مدخنة خفيفة. وجبة شهية ومناسبة لفرد واحد.",
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          intquantity += 1;
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    Text(
                      "${intquantity.toString()}",
                      style: titleStyle,
                    ),
                    IconButton(
                      onPressed: () {
                        if (intquantity > 1) {
                          intquantity -= 1;
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
                Text(
                  "الكمية",
                  style: titleStyle,
                ),
              ],
            ),
            const Divider(),
            const CustomLabel(
              text: "المكونات",
              Sizefont: 20,
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "رز",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "لحم",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "بهارات",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "ملح",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "رز",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "لحم",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "بهارات",
            ),
            const IngradiantsRow(
              ingimage: "assets/meal1.png",
              ingradiants: "ملح",
            ),
          ],
        ),
      ),
    );
  }
}
