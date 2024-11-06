import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/kitchen_provider.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/screen/order-flow/spacial_order_screen.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card_mini.dart';
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
    return Consumer<MealsProvider>(builder: (context, mealsConsumer, _) {
      return Consumer<KitchenProvider>(builder: (context, kitchenConsumer, _) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                kitchencardmini(
                  coverImage: kitchenConsumer.kitchenList[0].coverImage,
                  profileImage: kitchenConsumer.kitchenList[0].profileImage,
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
                          // const CustomLabel(
                          //   text: "الأصناف ",
                          //   Sizefont: 20,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 14),
                          //   child: SizedBox(
                          //     height: 50,
                          //     width: getsize(context).width,
                          //     child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: 5,
                          //       itemBuilder: (context, index) {
                          //         return CategoryButton(
                          //           text: "الكل",
                          //           onPressed: () {
                          //             setState(() {
                          //               selectedCategory = index;
                          //             });
                          //           },
                          //           isSlected: index == selectedCategory,
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),

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
                                  mealImage:
                                      mealsConsumer.primaryMeals[index].mealImage,
                                  id: mealsConsumer.primaryMeals[index].id,
                                  mealName: mealsConsumer.primaryMeals[index].mealName,
                                  price: mealsConsumer.primaryMeals[index].price,
                                  kitchenName:
                                      mealsConsumer.primaryMeals[index].kitchenName,
                                  rating: mealsConsumer.primaryMeals[index].rating,
                                  kitchenId:
                                      mealsConsumer.primaryMeals[index].kitchenId,
                                );
                              },
                              itemCount: mealsConsumer.primaryMeals.length,
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
                                  mealImage:
                                      mealsConsumer.primaryMeals[index].mealImage,
                                  id: mealsConsumer.primaryMeals[index].id,
                                  mealName: mealsConsumer.primaryMeals[index].mealName,
                                  price: mealsConsumer.primaryMeals[index].price,
                                  kitchenName:
                                      mealsConsumer.primaryMeals[index].kitchenName,
                                  rating: mealsConsumer.primaryMeals[index].rating,
                                  kitchenId:
                                      mealsConsumer.primaryMeals[index].kitchenId,
                                );
                              },
                              itemCount: mealsConsumer.primaryMeals.length,
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
                                  mealImage:
                                      mealsConsumer.availableMeals[index].mealImage,
                                  id: mealsConsumer.availableMeals[index].id,
                                  mealName: mealsConsumer.availableMeals[index].mealName,
                                  price: mealsConsumer.availableMeals[index].price,
                                  kitchenName:
                                      mealsConsumer.availableMeals[index].kitchenName,
                                  rating: mealsConsumer.availableMeals[index].rating,
                                  kitchenId:
                                      mealsConsumer.availableMeals[index].kitchenId,
                                );
                              },
                              itemCount: mealsConsumer.availableMeals.length,
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
    });
  }
}
