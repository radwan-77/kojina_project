import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/favorite_provider.dart';
import 'package:kojina_project/provider/kitchen_provider.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/widget/card/arji3a.dart';

import 'package:kojina_project/widget/static/custom_tabbar.dart';
import 'package:provider/provider.dart';

class FillFavirioteScreen extends StatefulWidget {
  const FillFavirioteScreen({super.key});

  @override
  State<FillFavirioteScreen> createState() => _FillFavirioteScreenState();
}

class _FillFavirioteScreenState extends State<FillFavirioteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, favoriteConsumer, _) {
      return Consumer<MealsProvider>(builder: (context, mealsConsumer, _) {
        return Consumer<KitchenProvider>(
            builder: (context, kitchenConsumer, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTabbar(
                    toppadding: 10,
                    tabs: [
                      Tab(
                        text: "مطابخ",
                      ),
                      Tab(
                        text: "وجبات",
                      ),
                    ],
                    contents: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //////////////kitchen card///////////////////
                          Text("Under development"),
                        ],
                      ),

                      ////////////meals card/////////////////////
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            // width: getsize(context).width * 0.7,

                            // The height is set to ensure that the ListView.builder has a defined space to render its items.
                            // Without a defined height, the ListView.builder might not render correctly or might cause layout issues.
                            width: getsize(context).width,
                            height: getsize(context).height * 0.3,
                            child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  favoriteConsumer.favoriteItemIds.length,
                              itemBuilder: (context, index) {
                                return CustomCard(
                                  mealImage: mealsConsumer
                                      .primaryMeals[index].mealImage,
                                  id: mealsConsumer.primaryMeals[index].id,
                                  mealName: mealsConsumer
                                      .primaryMeals[index].mealName,
                                  price:
                                      mealsConsumer.primaryMeals[index].price,
                                  kitchenName: mealsConsumer
                                      .primaryMeals[index].kitchenName,
                                  rating:
                                      mealsConsumer.primaryMeals[index].rating,
                                  kitchenId: mealsConsumer
                                      .primaryMeals[index].kitchenId,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      });
    });
  }
}
