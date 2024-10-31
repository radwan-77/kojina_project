import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/widget/card/spiacial_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class SpiacialOrderScreen extends StatefulWidget {
  const SpiacialOrderScreen({super.key});

  @override
  State<SpiacialOrderScreen> createState() => _SpiacialOrderScreenState();
}
// list from meals of the kitchen 

class _SpiacialOrderScreenState extends State<SpiacialOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MealsProvider>(builder: (context, mealsProvider, _) {
      return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),

                    /////////////////skip button//////////////////
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: tertiaryLight,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 3,
                                offset: Offset(0, 6),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_rounded,
                                size: 15,
                              ),
                              Text(
                                " تخطي",
                                style: bold10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  LinearPercentIndicator(
                    barRadius: Radius.circular(20),
                    lineHeight: 20,
                    center: Text("1/5"),
                    // width: getsize(context).width * 0.9,
                    animation: true,
                    animationDuration: 800,
                    percent: 0.8,
                    backgroundColor: tertiaryLight,
                    progressColor: mainColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "1/5 بوكس التذوق",
                          style: normal12,
                        )),
                  ),
                  SizedBox(height: 50),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "اختر اصناف بوكس التذوق",
                        style: bold15,
                      )),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: mealsProvider.meals.length,
                    itemBuilder: (context, index) {
                      return SpiacialCard(
                        meal: mealsProvider.meals[index],
                        mealName: mealsProvider.meals[index].mealName,
                        imageUrl: mealsProvider.meals[index].imageUrl,
                        kitchenName: mealsProvider.meals[index].kitchenName,
                        rating: mealsProvider.meals[index].rating,
                        price: mealsProvider.meals[index].price,
                      );
                    },
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 3,
                      offset: Offset(0, 6),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                    ),
                    Text(
                      " التالي",
                      style: bold16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
