import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isArrow;
  final String? subtitle;
  final Function onTap;

  const ProfileTile({
    super.key,
    this.isArrow = true,
    required this.title,
    required this.icon,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: subtitle != null ? 80 : 60,
        width: getsize(context).width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: mainColor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          leading: Icon(icon),
          horizontalTitleGap: 5,
          trailing: isArrow ? const Icon(Icons.arrow_forward_ios) : null,
          onLongPress: () {
            onTap();
          },
        ),
      ),
    );
  }
}
