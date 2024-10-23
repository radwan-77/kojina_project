import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/favorite_provider.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card_mini.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
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
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                kitchencardmini(
                    mainimage: "assets/meal1.png",
                    miniimage: "assets/face.png"),
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
                      // when use singelchildscrollview the content disapper
                      children: [
                        CustomLabel(
                          text: "Kitchen name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          // width: getsize(context).width * 0.7,

                          // The height is set to ensure that the ListView.builder has a defined space to render its items.
                          // Without a defined height, the ListView.builder might not render correctly or might cause layout issues.
                          height: getsize(context).height * 0.3,
                          child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: favoriteConsumer.favoriteItems.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                meal: mealsConsumer.meals[index],
                                mealName: favoriteConsumer
                                    .favoriteItems[index].mealName,
                                imageUrl: favoriteConsumer
                                    .favoriteItems[index].imageUrl,
                                kitchenName: favoriteConsumer
                                    .favoriteItems[index].kitchenName,
                                rating: favoriteConsumer
                                    .favoriteItems[index].rating,
                                price:
                                    favoriteConsumer.favoriteItems[index].price,
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
  }
}
