import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/screen/main-screen/add_new_location.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card.dart';
import 'package:kojina_project/widget/clickables/catagorybutton.dart';
import 'package:kojina_project/widget/static/custom_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
            child: Image.asset(
              "assets/kojina_light.png",
              // width: getsize(context).widget * 1,
            ),
          ),
        ]),
      ),
      appBar: PreferredSize(
        preferredSize: getsize(context) * 0.1,
        child: AppBar(
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => AddNewLocationScreen(),
                  ));
            },
            child: Column(
              children: [
                SizedBox(height: 4),
                Text("Kojina"),
                Text(
                  "الصفحة الرئيسية",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
              icon: const Icon(Icons.menu_open_sharp),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          mealName: "وجبة العرجيعة",
                          imageUrl: "assets/meal1.png",
                          kitchenName: "مطبخ جميرا",
                          rating: "4",
                          price: 35);
                    },
                    itemCount: 5,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                CustomLabel(text: "الأصناف الجديدة"),
              ],
            ),
            Row(
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
              ],
            ),
            SizedBox(
              height: getsize(context).height * 0.30,
              width: getsize(context).width * 0.9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomCard(
                        mealName: "وجبة العرجيعة",
                        imageUrl: "assets/meal1.png",
                        kitchenName: "مطبخ جميرا",
                        rating: "4",
                        price: 35);
                  }),
            ),
            CustomLabel(
              text: "المطابخ",
              Sizefont: 20,
              clickhere: "انظر للمزيد",
            ),
            SizedBox(
              height: getsize(context).height,
              width: getsize(context).width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return KitchenCard(
                        imageUrl: "assets/meal1.png",
                        kitchenName: "مطبخ جميرا",
                        rating: "4",
                        price: 35,
                        mineimage: "assets/meal1.png",
                        catagory: "مشاوي ");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

    // Row(
    //   children: [
    //     GridTile(
    //         child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Container(
    //         color: Colors.red,
    //         width: getsize(context).width * 0.6,
    //         height: getsize(context).height * 0.3,
    //         child: Image.asset(
    //           "assets/kojina_light.png",
    //           height: getsize(context).width * 0.7,
    //         ),
    //       ),
    //     )),
    //   ],
    // ));
