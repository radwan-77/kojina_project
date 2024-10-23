import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/screen/main-screen/meal_Screen.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card.dart';
import 'package:kojina_project/widget/card/kitchen_card_mini.dart';
import 'package:kojina_project/widget/clickables/catagorybutton.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/custom_tabbar.dart';
import 'package:provider/provider.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  int selectedCategory = 0;
  List<Map<String, dynamic>> meals = [
    {
      'mealName': 'وجبة العرجيعة',
      'imageUrl': 'assets/meal1.png',
      'kitchenName': 'مطبخ جميرا',
      'rating': '4',
      'price': 35,
    },
    {
      'mealName': 'وجبة الكبسة',
      'imageUrl': 'assets/meal1.png',
      'kitchenName': 'مطبخ الرياض',
      'rating': '5',
      'price': 40,
    },
    // Add more meal items as necessary...
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MealsProvider>(builder: (context, mealsProvider, _) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              kitchencardmini(
                mainimage: "assets/meal1.png",
                miniimage: "assets/face.png",
              ),
              CustomTabbar(
                tabs: [
                  Tab(text: "طلب مناسبه"),
                  Tab(text: "وجبات فرديه"),
                ],
                contents: [
                  // Content for "طلب مناسبه"
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "يفضل طلب بوكس تذوق قبل طلب اعداد كبيرة من الوجبات !",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      MainButton(text: "اطلب الان", onPressed: () {}),
                    ],
                  ),

                  // Content for "وجبات فرديه"
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomLabel(text: "حلو "),
                        SizedBox(
                          height: getsize(context).height * 0.30,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                meal: mealsProvider
                                    .meals[index], // Add itemId here
                                mealName: mealsProvider.meals[index].mealName,
                                imageUrl: mealsProvider.meals[index].imageUrl,
                                kitchenName:
                                    mealsProvider.meals[index].kitchenName,
                                rating: mealsProvider.meals[index].rating,
                                price: mealsProvider.meals[index].price,
                                // discount: mealsProvider.meals[index]
                                //     .discount, // Example discount, adjust as needed
                                mealpage: MealScreen(), // Pass meal screen
                                kitchenpage:
                                    KitchenScreen(), // Pass kitchen screen
                              );
                            },
                            itemCount: mealsProvider.meals.length,
                          ),
                        ),
                        CustomLabel(text: "مالح "),
                        SizedBox(
                          height: getsize(context).height * 0.30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                meal: mealsProvider
                                    .meals[index], // Add itemId here
                                mealName: mealsProvider.meals[index].mealName,
                                imageUrl: mealsProvider.meals[index].imageUrl,
                                kitchenName:
                                    mealsProvider.meals[index].kitchenName,
                                rating: mealsProvider.meals[index].rating,
                                price: mealsProvider.meals[index].price,
                                // discount: mealsProvider.meals[index]
                                //     .discount, // Example discount, adjust as needed
                                mealpage: MealScreen(), // Pass meal screen
                                kitchenpage:
                                    KitchenScreen(), // Pass kitchen screen
                              );
                            },
                            itemCount: mealsProvider.meals.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
