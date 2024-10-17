import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Container(
              child: TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: mainColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                  indicatorWeight: 3,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: mainColor,
                        width: 3,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      text: "الاشعارات",
                    ),
                    Tab(
                      text: "الرسائل",
                    ),
                  ]),
            ),
            Container(
              height: getsize(context).height * 0.5,
              child: TabBarView(
                controller: tabController,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/notification.png",
                          width: getsize(context).width * 0.5,
                        ),
                        Text("لا توجد اشعارات بعد", style: titleStyle),
                        Text("تصفح مختلف انواع الوجبات والمطاعم",
                            style: bodyStyle),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/notification.png",
                        width: getsize(context).width * 0.5,
                      ),
                      Text("لا توجد اشعارات بعد", style: titleStyle),
                      Text("تصفح مختلف انواع الوجبات والمطاعم",
                          style: bodyStyle),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("الاشعارات"),
      ),
    );
  }
}
