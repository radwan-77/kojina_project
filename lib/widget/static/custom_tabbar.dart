import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class CustomTabbar extends StatelessWidget {
  final List<Widget> contents;
  final List<Tab> tabs;
  final double toppadding;
  // final TabController tabController;
  CustomTabbar({
    super.key,
    required this.contents,
    required this.tabs,
    this.toppadding = 20,
    // required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: toppadding),
      child: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            TabBar(
                // controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
                indicatorWeight: 3,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: mainColor,
                      width: 3,
                    ),
                  ),
                ),
                tabs: tabs),
            SizedBox(
              height: getsize(context).height * 0.5,
              child: TabBarView(
                // controller: tabController,
                children: contents,
              ),
            )
          ],
        ),
      ),
    );
  }
}
