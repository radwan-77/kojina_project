import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/widget/static/custom_tabbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}
// no work here 

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTabbar(
        tabs: [
          Tab(
            text: "الاشعارات",
          ),
          Tab(
            text: "الرسائل",
          ),
        ],
        contents: [
          Center(
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
          Center(
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
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الاشعارات"),
      ),
    );
  }
}
