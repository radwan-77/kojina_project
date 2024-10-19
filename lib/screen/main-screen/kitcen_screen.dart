import 'package:flutter/material.dart';
import 'package:kojina_project/widget/card/kitchen_card.dart';
import 'package:kojina_project/widget/card/kitchen_card_mini.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/customtabbar.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          kitchencardmini(
              mainimage: "assets/meal1.png", miniimage: "assets/face.png"),
          customtabbar(
            text1: "text1",
            text2: "text2",
            tab1: Column(
              children: [
                CustomLabel(text: "حلويات"),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return KitchenCard(
                        imageUrl: "assets/meal1.png",
                        kitchenName: "مطبخ الامير",
                        rating: "4.5",
                        price: 100,
                        mineimage: "assets/meal1.png",
                        catagory: "مطبخ",
                      );
                    },
                  ),
                ),
              ],
            ),
            tab2: Column(
              // when use singelchildscrollview the content disapper
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return KitchenCard(
                        imageUrl: "assets/meal1.png",
                        kitchenName: "مطبخ الامير",
                        rating: "4.5",
                        price: 100,
                        mineimage: "assets/meal1.png",
                        catagory: "مطبخ",
                      );
                    },
                  ),
                ),
              ],
            ),
            tabController: tabController,
          ),
        ],
      ),
    );
  }
}
