import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/widget/clickables/add_to_cart_button.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/static/custom_label.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int intquantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          AddToCartButton(text: "اضف للسلة", onPressed: () {}),
      appBar: AppBar(
        title: Text("Meal Screen"),
      ),
      body: Column(
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
          Text(
            "أرز متبل بالتوابل العربية مثل الزعفران والهيل، يُقدم مع قطع لحم مشوي طري (دجاج أو غنم)، بنكهة مدخنة خفيفة. وجبة شهية ومناسبة لفرد واحد.",
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
                    icon: Icon(Icons.add_circle_outline),
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
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                ],
              ),
              Text(
                "الكمية",
                style: titleStyle,
              ),
            ],
          ),
          Divider(),
          CustomLabel(
            text: "المكونات",
            Sizefont: 20,
          ),
          rowIngridants(
            ingimage: "assets/meal1.png",
            ingradiants: "رز",
          )
        ],
      ),
    );
  }
}

class rowIngridants extends StatelessWidget {
  final String ingradiants;
  final String ingimage;
  const rowIngridants({
    super.key,
    required this.ingradiants,
    required this.ingimage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                ingimage,
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Text(ingradiants),
            ],
          ),
          Checkbox(
            value: true,
            onChanged: (value) => null,
          )
        ],
      ),
    );
  }
}
