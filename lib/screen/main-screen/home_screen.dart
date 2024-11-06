import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/kitchen_provider.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/screen/main-screen/kitcen_screen.dart';
import 'package:kojina_project/screen/main-screen/meal_Screen.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card.dart';
import 'package:kojina_project/widget/clickables/catagorybutton.dart';
import 'package:kojina_project/widget/input/searchbar.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<KitchenProvider>(context, listen: false).getKitchen();
    Provider.of<KitchenProvider>(context, listen: false)
        .getMealsByCategory(categories[1]);

    super.initState();
  }

  int selectedCategory = 0;
  final controller = TextEditingController();
  final List<String> categories = [
    'الكل',
    'وجبات رئيسية',
    'مالح',
    'حلو',
    'سلطات',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MealsProvider>(builder: (context, mealsConsumer, _) {
      return Consumer<KitchenProvider>(builder: (context, kitchenConsumer, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomeSearchBar(
                controller: controller,
                hint: "ابحث عن وجبتك المفضلة",
                prefix: const Icon(
                  Icons.search,
                  size: 30,
                ),
                suffix: const Icon(
                  Icons.filter_alt_outlined,
                  size: 30,
                ),
              ),
              Column(
                children: [
                  ////////////////////discounts////////////////////////
                  const CustomLabel(
                    text: "التخفيضات",
                    clickhere: "انظر للمزيد",
                  ),
                  SizedBox(
                    height: getsize(context).height * 0.30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mealsConsumer.discountedMeals.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          id: mealsConsumer.discountedMeals[index].id,
                          mealName:
                              mealsConsumer.discountedMeals[index].mealName,
                          price: mealsConsumer.discountedMeals[index].price,
                          kitchenName:
                              mealsConsumer.discountedMeals[index].kitchenName,
                          rating: mealsConsumer.discountedMeals[index].rating,
                          kitchenId:
                              mealsConsumer.discountedMeals[index].kitchenId,
                          mealImage:
                              mealsConsumer.discountedMeals[index].mealImage,
                          discount: mealsConsumer
                              .discountedMeals[index].discount
                              ?.toInt(),
                          kitchenpage: KitchenScreen(),
                          mealpage: MealScreen(),
                        );
                      },
                    ),
                  ),
                  ////////////////////avilibal meals////////////////////////
                  const CustomLabel(
                    text: "الوجبات المتاحة",
                    clickhere: "انظر للمزيد",
                  ),
                  SizedBox(
                    height: getsize(context).height * 0.30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mealsConsumer.primaryMeals.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          id: mealsConsumer.primaryMeals[index].id,
                          mealName: mealsConsumer.primaryMeals[index].mealName,
                          price: mealsConsumer.primaryMeals[index].price,
                          kitchenName:
                              mealsConsumer.primaryMeals[index].kitchenName,
                          rating: mealsConsumer.primaryMeals[index].rating,
                          kitchenId:
                              mealsConsumer.primaryMeals[index].kitchenId,
                          mealImage:
                              mealsConsumer.primaryMeals[index].mealImage,
                          kitchenpage: KitchenScreen(),
                          mealpage: MealScreen(),
                        );
                      },
                    ),
                  ),
                ],
              ),

              /////////////////categories////////////////////////
              const CustomLabel(
                text: "الأصناف",
                clickhere: "انظر للمزيد",
                Sizefont: 20,
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      height: 50,
                      width: getsize(context).width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CategoryButton(
                            text: categories[index] // Add category name here
                            ,
                            onPressed: () {
                              kitchenConsumer
                                  .getMealsByCategory(categories[index]);
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
                  SizedBox(
                    height: getsize(context).height * 0.30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          id: mealsConsumer.availableMeals[index].id,
                          mealName:
                              mealsConsumer.availableMeals[index].mealName,
                          price: mealsConsumer.availableMeals[index].price,
                          kitchenName:
                              mealsConsumer.availableMeals[index].kitchenName,
                          rating: mealsConsumer.availableMeals[index].rating,
                          kitchenId:
                              mealsConsumer.availableMeals[index].kitchenId,
                          mealImage:
                              mealsConsumer.availableMeals[index].mealImage,
                          kitchenpage: KitchenScreen(),
                          mealpage: MealScreen(),
                        );
                      },
                      itemCount: mealsConsumer.availableMeals.length,
                    ),
                  ),
                  // SizedBox(
                  //   height: getsize(context).height * 0.30,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: kitchenConsumer.categoryMeals.length,
                  //     itemBuilder: (context, index) {
                  //       print(
                  //           "fgjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjidjid" +
                  //               kitchenConsumer.categoryMeals[index].mealName);
                  //       return SizedBox(
                  //         height: getsize(context).height * 0.10,
                  //         child: CustomCard(
                  //           mealName: kitchenConsumer.categoryMeals.isEmpty
                  //               ? kitchenConsumer.categoryMeals[index].mealName
                  //               : "No meals",
                  //           id: kitchenConsumer.categoryMeals.isEmpty
                  //               ? kitchenConsumer.categoryMeals[index].id
                  //               : 0,
                  //           price: kitchenConsumer.categoryMeals.isEmpty
                  //               ? (kitchenConsumer.categoryMeals[index].price ??
                  //                   0.0)
                  //               : 0.0,
                  //           kitchenName: kitchenConsumer.categoryMeals.isEmpty
                  //               ? kitchenConsumer
                  //                   .categoryMeals[index].kitchenName
                  //               : "No kitchen",
                  //           rating: kitchenConsumer.categoryMeals[index].rating,
                  //           kitchenId:
                  //               kitchenConsumer.categoryMeals[index].kitchenId,
                  //           mealImage: kitchenConsumer.categoryMeals.isEmpty
                  //               ? kitchenConsumer.categoryMeals[index].mealImage
                  //               : "ddd",
                  //           mealDescription:
                  //               kitchenConsumer.categoryMeals.isEmpty
                  //                   ? kitchenConsumer
                  //                       .categoryMeals[index].mealDescription
                  //                   : "ddd",
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),

              //////////////////////kitchen////////////////////////

              const CustomLabel(
                text: "المطابخ",
                Sizefont: 20,
                clickhere: "انظر للمزيد",
              ),
              SizedBox(
                height: getsize(context).height * 0.30,
                width: getsize(context).width * 0.9,
                child: kitchenConsumer.kitchenList.isEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5, // Number of shimmer items
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: SizedBox(
                              height: getsize(context).height * 0.30,
                              width: getsize(context).width * 0.9,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: getsize(context).height * 0.20,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: getsize(context).width * 0.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: getsize(context).width * 0.3,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: kitchenConsumer.kitchenList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            // height: getsize(context).height * 0.40,
                            width: getsize(context).width * 0.9,
                            child: KitchenCard(
                              imageUrl:
                                  kitchenConsumer.kitchenList[index].coverImage,
                              mineimage: kitchenConsumer
                                  .kitchenList[index].profileImage,
                              kitchenName: kitchenConsumer
                                  .kitchenList[index].kitchenName,
                              catagory:
                                  kitchenConsumer.kitchenList[index].categories,
                              kitchenpage: KitchenScreen(),
                            ),
                          );
                        },
                      ),
              ),
              // SizedBox(
              //   height: getsize(context).height * 0.30,
              // )
            ],
          ),
        );
      });
    });
  }
}
