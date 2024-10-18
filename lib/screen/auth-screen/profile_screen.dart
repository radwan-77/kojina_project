import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/listtiledrawer.dart';
import 'package:kojina_project/widget/static/profiletile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              "assets/face.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Divider(),
          ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
          ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
          ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
          CustomLabel(text: "text"),
          ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
        ],
      ),
    ));
  }
}
