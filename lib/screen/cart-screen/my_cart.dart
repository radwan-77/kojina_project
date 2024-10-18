import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  int conter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating action button from meal screen
      appBar: AppBar(
        title: const Text('MyWidget'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: getsize(context).width * 0.9,
              decoration: BoxDecoration(
                color: tertiaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  MealRowWidget(
                      imageUrl: "assets/meal1.png",
                      mealName: " وجبه العرجيعة",
                      kitchenName: " جيميرا",
                      price: 20),
                  Row(
                    children: [
                      Image.asset(
                        "assets/meal1.png",
                        width: 120,
                        height: 120,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "وجبة العرجيعة",
                                style: bodyStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "مطبخ جيميرا",
                                style: minibodyStyle,
                              ),
                              Text(
                                "20",
                                style: minibodyStyle,
                              )
                            ],
                          )
                        ],
                      ),

                      //////////////////////////////////////////
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                conter += 1;
                              });
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                          Text(
                            "${conter.toString()}",
                            style: titleStyle,
                          ),
                          IconButton(
                            onPressed: () {
                              if (conter > 1) {
                                conter -= 1;
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealRowWidget extends StatefulWidget {
  final String imageUrl;
  final String mealName;
  final String kitchenName;
  final double price;

  const MealRowWidget({
    super.key,
    required this.imageUrl,
    required this.mealName,
    required this.kitchenName,
    required this.price,
  });

  @override
  _MealRowWidgetState createState() => _MealRowWidgetState();
}

class _MealRowWidgetState extends State<MealRowWidget> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Meal Image
            Image.asset(
              widget.imageUrl,
              width: 120,
              height: 120,
            ),
            // Meal Info Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.mealName,
                      style: bodyStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.kitchenName,
                      style: bodyStyle,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.price} د",
                      style: bodyStyle,
                    ),
                  ],
                ),
              ],
            ),
            // Quantity Row
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        counter += 1;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  Text(
                    counter.toString(),
                    style: titleStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      if (counter > 1) {
                        setState(() {
                          counter -= 1;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
