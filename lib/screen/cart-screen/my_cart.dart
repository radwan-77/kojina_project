import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/theme/lighte_mode.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  int conter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyWidget'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: getsize(context).width * 0.9,
              decoration: BoxDecoration(
                color: tertiaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/meal1.png",
                        width: 120,
                        height: 120,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "وجبة العرجيعة",
                                style: bodyStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "مطبخ جيميرا",
                                style: minibodyStyle,
                              ),
                              Text(
                                "20",
                                style: minibodyStyle,
                              )
                            ],
                          )
                        ],
                      ),
            
                      //////////////////////////////////////////
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                conter += 1;
                              });
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                          Text(
                            "${conter.toString()}",
                            style: titleStyle,
                          ),
                          IconButton(
                            onPressed: () {
                              if (conter > 1) {
                                conter -= 1;
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
