import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
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
      child: SingleChildScrollView(
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
            CustomLabel(text: "الأعدادات"),
            ProfileTile(
              title: "اللغة",
              subtitle: "العربية",
              icon: Icons.language,
            ),
            ProfileTile(
              title: "الاشعارات",
              subtitle: "مفعلة",
              icon: Icons.notifications,
            ),
            ProfileTile(
              title: "المساعدة",
              icon: Icons.help,
            ),
            CustomLabel(text: "من نحن "),
            ProfileTile(
              title: "عن التطبيق",
              icon: Icons.info,
            ),
            ProfileTile(
              title: "الشروط والاحكام",
              icon: Icons.rule,
            ),
            ProfileTile(
              title: "سياسة الخصوصية",
              icon: Icons.privacy_tip,
            ),
            ProfileTile(
              title: "تسجيل الخروج",
              icon: Icons.logout,
            ),
            SizedBox(
              height: getsize(context).height * 0.05,
            ),
          ],
        ),
      ),
    ));
  }
}
