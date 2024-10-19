import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class CustomExpantionTile extends StatelessWidget {
  final String expansionTitle;
  final List<Widget> childern;
  const CustomExpantionTile({
    super.key, required this.expansionTitle, required this.childern,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getsize(context).width * 0.95,
      decoration: BoxDecoration(
        color: onPrimaryDark,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child:  ExpansionTile(
        title: Text(expansionTitle),
        children: childern,
      ),
    );
  }
}
