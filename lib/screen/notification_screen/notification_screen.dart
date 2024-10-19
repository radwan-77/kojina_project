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
        tab1: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/notification.png",
                width: getsize(context).width * 0.5,
              ),
              Text("لا توجد طلبات بعد", style: bold20),
              Text("تصفح مختلف انواع الوجبات والمطاعم", style: bold20),
            ],
          ),
        ),
        tab2: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/chat.png",
                width: getsize(context).width * 0.5,
              ),
              Text("لا توجد طلبات بعد", style: bold20),
              Text("تصفح مختلف انواع الوجبات والمطاعم", style: bold20),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الاشعارات"),
      ),
    );
  }
}
