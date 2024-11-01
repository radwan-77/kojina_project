import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/main.dart';
import 'package:kojina_project/provider/auth_provider.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:kojina_project/widget/static/profiletile.dart';
import 'package:provider/provider.dart';

class SettingsSCreen extends StatelessWidget {
  const SettingsSCreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authConsumer, child) {
      return Scaffold(
          appBar: AppBar(),
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
                    onTap: () {},
                    title: "اللغة",
                    subtitle: "العربية",
                    icon: Icons.language,
                  ),
                  ProfileTile(
                    onTap: () {},
                    title: "الاشعارات",
                    subtitle: "مفعلة",
                    icon: Icons.notifications,
                  ),
                  ProfileTile(
                    onTap: () {},
                    title: "المساعدة",
                    icon: Icons.help,
                  ),
                  CustomLabel(text: "من نحن "),
                  ProfileTile(
                    onTap: () {},
                    title: "عن التطبيق",
                    icon: Icons.info,
                  ),
                  ProfileTile(
                    onTap: () {},
                    title: "الشروط والاحكام",
                    icon: Icons.rule,
                  ),
                  ProfileTile(
                    onTap: () {},
                    title: "سياسة الخصوصية",
                    icon: Icons.privacy_tip,
                  ),
                  ProfileTile(
                    title: "تسجيل الخروج",
                    icon: Icons.logout,
                    onTap: () {
                      Provider.of<AuthenticationProvider>(context,
                              listen: false)
                          .logout()
                          .then((logedOut) {
                        if (logedOut) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ScreenRouter()),
                              (route) => false);
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: getsize(context).height * 0.05,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
