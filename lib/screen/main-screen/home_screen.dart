import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/kitchen_model.dart';
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
    super.initState();
  }

  int selectedCategory = 0;
  final controller = TextEditingController();

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
                  const CustomLabel(
                    text: "التخفيضات",
                    clickhere: "انظر للمزيد",
                  ),
                  SizedBox(
                    height: getsize(context).height * 0.30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          meal: mealsConsumer.meals[index], // Add itemId here
                          mealName: mealsConsumer.meals[index].mealName,
                          imageUrl: mealsConsumer.meals[index].imageUrl,
                          kitchenName: mealsConsumer.meals[index].kitchenName,
                          rating: mealsConsumer.meals[index].rating,
                          price: mealsConsumer.meals[index].price,
                          // discount: mealsConsumer.meals[index]
                          //     .discount, // Example discount, adjust as needed
                          mealpage: MealScreen(), // Pass meal screen
                          kitchenpage: KitchenScreen(), // Pass kitchen screen
                        );
                      },
                      itemCount: mealsConsumer.meals.length,
                    ),
                  ),
                  //////////////////////all meals////////////////////////
                  // const CustomLabel(
                  //   text: "الوجبات المتاحة",
                  //   clickhere: "انظر للمزيد",
                  // ),
                  // SizedBox(
                  //   height: getsize(context).height * 0.30,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return CustomCard(
                  //         meal: mealsConsumer.meals[index], // Add itemId here
                  //         mealName: mealsConsumer.meals[index].mealName,
                  //         imageUrl: mealsConsumer.meals[index].imageUrl,
                  //         kitchenName: mealsConsumer.meals[index].kitchenName,
                  //         rating: mealsConsumer.meals[index].rating,
                  //         price: mealsConsumer.meals[index].price,
                  //         // discount: mealsConsumer.meals[index]
                  //         //     .discount, // Example discount, adjust as needed
                  //         mealpage: MealScreen(), // Pass meal screen
                  //         kitchenpage: KitchenScreen(), // Pass kitchen screen
                  //       );
                  //     },
                  //     itemCount: mealsConsumer.meals.length,
                  //   ),
                  // ),
                ],
              ),
              const CustomLabel(
                text: "الأصناف الجديدة",
                clickhere: "انظر للمزيد",
                Sizefont: 20,
              ),
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
              //////////////////////update when select category////////////////////////
              // SizedBox(
              //   height: getsize(context).height * 0.30,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return CustomCard(
              //         meal: mealsConsumer.meals[index], // Add itemId here
              //         mealName: mealsConsumer.meals[index].mealName,
              //         imageUrl: mealsConsumer.meals[index].imageUrl,
              //         kitchenName: mealsConsumer.meals[index].kitchenName,
              //         rating: mealsConsumer.meals[index].rating,
              //         price: mealsConsumer.meals[index].price,
              //         // discount: mealsConsumer.meals[index]
              //         //     .discount, // Example discount, adjust as needed
              //         mealpage: MealScreen(), // Pass meal screen
              //         kitchenpage: KitchenScreen(), // Pass kitchen screen
              //       );
              //     },
              //     itemCount: mealsConsumer.meals.length,
              //   ),
              // ),
              const CustomLabel(
                text: "المطابخ",
                Sizefont: 20,
                clickhere: "انظر للمزيد",
              ),
              SizedBox(
                height: getsize(context).height * 0.30,
                width: getsize(context).width,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: kitchenConsumer.kitchenList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: getsize(context).height * 0.30,
                      width: getsize(context).width * 0.9,
                      child: KitchenCard(
                        imageUrl: kitchenConsumer.kitchenList[index].coverImage,
                        mineimage:
                            kitchenConsumer.kitchenList[index].profileImage,
                        kitchenName:
                            kitchenConsumer.kitchenList[index].kitchenName,
                        catagory: kitchenConsumer.kitchenList[index].categories,
                        kitchenpage: KitchenScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
