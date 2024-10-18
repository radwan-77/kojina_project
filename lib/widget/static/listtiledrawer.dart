import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  final String titletext;
  final Widget? nextpage;
  final IconData icon;

  const ListTileDrawer({
    super.key,
    required this.titletext,
    required this.nextpage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titletext),
      leading: Icon(icon),
      onTap: () {
        if (nextpage != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => nextpage!,
              ));
        } else {
          if (kDebugMode) {
            print("no page");
          }
        }
      },
    );
  }
}