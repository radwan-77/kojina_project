import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/screen/main-screen/add_new_location.dart';
import 'package:kojina_project/screen/notification_screen/notification_screen.dart';
import 'package:kojina_project/widget/card/arji3a.dart';
import 'package:kojina_project/widget/card/kitchen_card.dart';
import 'package:kojina_project/widget/clickables/catagorybutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';
import 'package:kojina_project/widget/input/searchbar.dart';
import 'package:kojina_project/widget/static/custom_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
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
          const list_tile_drawer(
              icon: Icons.home,
              titletext: "الصفحة الرئيسية",
              nextpage: HomeScreen()),
          const list_tile_drawer(
              titletext: "محفظتي",
              nextpage: null,
              icon: Icons.wallet_membership),
          const list_tile_drawer(
              titletext: "الأعدادات", nextpage: null, icon: Icons.settings),
          const Divider(),
          const list_tile_drawer(
              titletext: "حول البرنامج",
              nextpage: null,
              icon: Icons.warning_amber_outlined),
          const list_tile_drawer(
              titletext: "تواصل معنا",
              nextpage: null,
              icon: Icons.contact_mail),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ClipOval(
              child: Image.asset(
                "assets/X.png",
                width: 60,
                height: 60,
              ),
            ),
            ClipOval(
              child: Image.asset(
                "assets/ins.png",
                width: 60,
                height: 60,
              ),
            ),
            ClipOval(
              child: Image.asset(
                "assets/facebook.png",
                width: 60,
                height: 60,
              ),
            ),
          ])
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
                    builder: (context) => const AddNewLocationScreen(),
                  ));
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                Text("الموقع", style: titleStyle),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "  العمل",
                      style: bodyStyle,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: mainColor,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return const NotificationScreen();
                }));
              },
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
                    return CustomCard(
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
            SizedBox(
              height: getsize(context).height,
              width: getsize(context).width,
              child: ListView.builder(
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
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class list_tile_drawer extends StatelessWidget {
  final String titletext;
  final Widget? nextpage;
  final IconData icon;

  const list_tile_drawer({
    super.key,
    required this.titletext,
    required this.nextpage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titletext),
      leading: Icon(icon),
      onTap: () {
        if (nextpage != null)
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => nextpage!,
              ));
        else {
          print("no page");
        }
      },
    );
  }
}
