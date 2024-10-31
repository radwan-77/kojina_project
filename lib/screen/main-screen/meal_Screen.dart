import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/kitchen_provider.dart';
import 'package:kojina_project/widget/clickables/add_to_cart_button.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/ingradiant_row.dart';
import 'package:provider/provider.dart';

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
    return Consumer<KitchenProvider>(builder: (context, kitchenConsumer, _) {
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
                padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "وجبة العرجيعة",
                      style: bold16,
                    ),
                    Text(
                      "35 دينار ",
                      style: bold16,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 10),
                      child: Text(
                        "أرز متبل بالتوابل العربية مثل الزعفران والهيل، يُقدم مع قطع لحم مشوي طري (دجاج أو غنم)، بنكهة مدخنة خفيفة. وجبة شهية ومناسبة لفرد واحد.",
                        style: normal15,
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
                        style: bold15,
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
                    style: bold15,
                  ),
                ],
              ),
              const Divider(),
              const CustomLabel(
                text: "المكونات",
                Sizefont: 20,
              ),
              // the ingerdiant from the api
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
              SizedBox(
                height: getsize(context).height * 0.1,
              )
            ],
          ),
        ),
      );
    });
  }
}
