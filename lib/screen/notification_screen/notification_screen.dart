import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/widget/static/customtabbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: customtabbar(
          tabController: tabController,
          text1: "الاشعارات",
          text2: "الرسائل",
          tab1: const Center(
            child: Column(
              children: [Text("الاشعارات")],
            ),
          ),
          tab2: const Center(
            child: Column(
              children: [Text("d")],
            ),
          )),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الاشعارات"),
      ),
    );
  }
}

