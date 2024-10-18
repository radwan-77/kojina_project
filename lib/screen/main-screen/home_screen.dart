import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card.dart';
import 'package:kojina_project/widget/clickables/catagorybutton.dart';
import 'package:kojina_project/widget/input/searchbar.dart';
import 'package:kojina_project/widget/static/custom_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<Meal> meals = [
    Meal(
        mealName: "وجبة العرجيعة",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ جميرا",
        rating: "4",
        price: 35),
    Meal(
        mealName: "وجبة الكبسة",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ الرياض",
        rating: "5",
        price: 40),
    Meal(
        mealName: "وجبة المندي",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ صنعاء",
        rating: "4.5",
        price: 45),
    Meal(
        mealName: "وجبة الشاورما",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ دمشق",
        rating: "4",
        price: 30),
    Meal(
        mealName: "وجبة البرجر",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ نيويورك",
        rating: "4.2",
        price: 50),
    Meal(
        mealName: "وجبة السوشي",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ طوكيو",
        rating: "4.8",
        price: 60),
    Meal(
        mealName: "وجبة البيتزا",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ روما",
        rating: "4.3",
        price: 55),
  ];
    int selectedCategory = 0;
    final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            CustomeSearchBar(
              controller: controller,
              hint: "ابحث عن وجبتك",
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
                          discount: 55,
                          mealName: meals[index].mealName,
                          imageUrl: meals[index].imageUrl,
                          kitchenName: meals[index].kitchenName,
                          rating: meals[index].rating,
                          price: meals[index].price);
                    },
                    itemCount: meals.length,
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
              width: getsize(context).width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CustomCard(
                        mealName: "وجبة العرجيعة",
                        imageUrl: "assets/meal1.png",
                        kitchenName: "مطبخ جميرا",
                        rating: "4",
                        price: 35);
                  }),
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
                      catagory: "مشاوي ");
                }),
          ],
        ),
      );
  }
}