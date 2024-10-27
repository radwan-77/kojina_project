import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/screen/main-screen/meal_Screen.dart';
import 'package:kojina_project/screen/order-flow/spiacial_order_screen.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
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
                      MainButton(
                          text: "اطلب الان",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpiacialOrderScreen()));
                          }),
                    ],
                  ),

                  // Content for "وجبات فرديه"
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomLabel(
                          text: "الأصناف ",
                          Sizefont: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: SizedBox(
                            height: 50,
                            width: getsize(context).width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return CategoryButton(
                                  text: "الكل",
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory = index;
                                    });
                                  },
                                  isSlected: index == selectedCategory,
                                );
                              },
                            ),
                          ),
                        ),

                        // category 1
                        const CustomLabel(
                          text: "صنف 1 ",
                        ),
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
                        // category 2
                        const CustomLabel(
                          text: "صنف 2 ",
                        ),
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
                        // cataegory 3
                        const CustomLabel(
                          text: "صنف 3 ",
                        ),
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
