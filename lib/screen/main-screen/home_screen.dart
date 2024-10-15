import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              // width: Getsize(context).widget * 1,
            ),
          ),
          
        ]),
      ),
      appBar: PreferredSize(
        preferredSize: Getsize(context) * 0.1,
        child: AppBar(
          centerTitle: true,
          title: Column(
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
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              }),
        ),
      ),
      body: Text("Home Screen"),
    );
  }
}
