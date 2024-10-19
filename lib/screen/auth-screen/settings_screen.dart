import 'package:flutter/material.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/profiletile.dart';

class SettingsSCreen extends StatelessWidget {
  const SettingsSCreen({
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
          const Divider(),
          const ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
          const ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
          const ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
          const CustomLabel(text: "text"),
          const ProfileTile(
            title: "الأعدادات",
            icon: Icons.settings,
          ),
        ],
      ),
    ));
  }
}
