import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/screen/cart-screen/empty_cart_screen.dart';
import 'package:kojina_project/screen/faviriote-screen/fav_screen.dart';
import 'package:kojina_project/screen/main-screen/add_new_location.dart';
import 'package:kojina_project/screen/notification_screen/notification_screen.dart';
import 'package:kojina_project/screen/ordre_screen/order_screen.dart';
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
  List<Widget> screens = [
    const HomewScreen(),
    const FavoriteScreen(),
    const OrderScreen(),
    const CartScreen(),
  ];

  int curruntindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          onTabChange: (int newindex) {
            setState(() {
              curruntindex = newindex;
            });
          },
          haptic: false,
          hoverColor: Colors.blue,
          style: GnavStyle.google,
          backgroundColor: onPrimaryDark,
          activeColor: mainColor,
          color: tertiaryDark,
          iconSize: 24,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'الرئيسية',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'المفضلة',
            ),
            GButton(
              icon: Icons.not_listed_location,
              text: 'الطلبات',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'السلة',
            ),
          ]),
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
                    const Icon(
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
      body: screens[curruntindex],
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
        if (nextpage != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => nextpage!,
              ));
        } else {
          if (kDebugMode) {
            print("no page");
          }
        }
      },
    );
  }
}

class HomewScreen extends StatefulWidget {
  const HomewScreen({super.key});

  @override
  State<HomewScreen> createState() => _HomewScreenState();
}

class _HomewScreenState extends State<HomewScreen> {
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
