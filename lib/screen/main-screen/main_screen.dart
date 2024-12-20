import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/screen/DrawerScreen/settings_screen.dart';
import 'package:kojina_project/screen/cart-screen/empty_cart_screen.dart';
import 'package:kojina_project/screen/cart-screen/my_cart.dart';
import 'package:kojina_project/screen/faviriote-screen/fav_screen.dart';
import 'package:kojina_project/screen/main-screen/add_new_location.dart';
import 'package:kojina_project/screen/main-screen/home_screen.dart';
import 'package:kojina_project/screen/notification_screen/notification_screen.dart';
import 'package:kojina_project/screen/ordre_screen/order_screen.dart';

import 'package:kojina_project/widget/static/listtiledrawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLocation = false;

  List<Widget> screens = [
    HomeScreen(),
    const FavoriteScreen(),
    const OrderScreen(),
    const MyCartScreen(),
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
              icon: Icons.list_alt,
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
          const ListTileDrawer(
              icon: Icons.home,
              titletext: "الصفحة الرئيسية",
              nextpage: MainScreen()),
          const ListTileDrawer(
              titletext: "محفظتي",
              nextpage: null,
              icon: Icons.wallet_membership),
          const ListTileDrawer(
              titletext: "الأعدادات",
              nextpage: SettingsSCreen(),
              icon: Icons.settings),
          const Divider(),
          const ListTileDrawer(
              titletext: "حول البرنامج",
              nextpage: null,
              icon: Icons.warning_amber_outlined),
          const ListTileDrawer(
              titletext: "تواصل معنا",
              nextpage: null,
              icon: Icons.contact_mail),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ClipOval(
              child: Image.asset(
                "assets/X.png",
                width: 50,
                height: 50,
              ),
            ),
            ClipOval(
              child: Image.asset(
                "assets/ins.png",
                width: 50,
                height: 50,
              ),
            ),
            ClipOval(
              child: Image.asset(
                "assets/facebook.png",
                width: 50,
                height: 50,
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
                Text("الموقع", style: bold15),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "  العمل",
                      style: bold15,
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
