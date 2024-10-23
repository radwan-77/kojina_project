import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/screen/main-screen/kitcen_screen.dart';
import 'package:kojina_project/screen/main-screen/kitchen_screen.dart';
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
  int selectedCategory = 0;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MealsProvider>(builder: (context, mealsProvider, _) {
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
                  text: "الوجبات المتاحة",
                  clickhere: "انظر للمزيد",
                ),
                SizedBox(
                  height: getsize(context).height * 0.30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        meal: mealsProvider.meals[index], // Add itemId here
                        mealName: mealsProvider.meals[index].mealName,
                        imageUrl: mealsProvider.meals[index].imageUrl,
                        kitchenName: mealsProvider.meals[index].kitchenName,
                        rating: mealsProvider.meals[index].rating,
                        price: mealsProvider.meals[index].price,
                        // discount: mealsProvider.meals[index]
                        //     .discount, // Example discount, adjust as needed
                        mealpage: MealScreen(), // Pass meal screen
                        kitchenpage: KitchenScreen(), // Pass kitchen screen
                      );
                    },
                    itemCount: mealsProvider.meals.length,
                  ),
                ),
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
            SizedBox(
              height: getsize(context).height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomCard(
                    meal: mealsProvider.meals[index], // Add itemId here
                    mealName: mealsProvider.meals[index].mealName,
                    imageUrl: mealsProvider.meals[index].imageUrl,
                    kitchenName: mealsProvider.meals[index].kitchenName,
                    rating: mealsProvider.meals[index].rating,
                    price: mealsProvider.meals[index].price,
                    // discount: mealsProvider.meals[index]
                    //     .discount, // Example discount, adjust as needed
                    mealpage: MealScreen(), // Pass meal screen
                    kitchenpage: KitchenScreen(), // Pass kitchen screen
                  );
                },
                itemCount: mealsProvider.meals.length,
              ),
            ),
            const CustomLabel(
              text: "المطابخ",
              Sizefont: 20,
              clickhere: "انظر للمزيد",
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return KitchenCard(
                  imageUrl: "assets/meal1.png",
                  kitchenName: "مطبخ جميرا",
                  rating: "4",
                  price: 35,
                  mineimage: "assets/meal1.png",
                  catagory: "مشاوي ",
                  kitchenpage: KitchenScreen(),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
