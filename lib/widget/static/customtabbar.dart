import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class customtabbar extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget tab1;
  final Widget tab2;
  final double toppadding;
  final TabController tabController;
  customtabbar({
    super.key,
    required this.text1,
    required this.text2,
    required this.tab1,
    required this.tab2,
    this.toppadding = 20, required this.tabController,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: toppadding),
      child: Column(
        children: [
          TabBar(
              controller: tabController,
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
              tabs: [
                Tab(
                  text: text1,
                ),
                Tab(
                  text: text2,
                ),
              ]),
          SizedBox(
            height: getsize(context).height * 0.5,
            child: TabBarView(
              controller: tabController,
              children: [tab1, tab2],
            ),
          )
        ],
      ),
    );
  }
}
