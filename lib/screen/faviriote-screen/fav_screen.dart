import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/favorite_provider.dart';
import 'package:kojina_project/screen/faviriote-screen/fill_fav_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, favoriteConsumer, _) {
      return Scaffold(
        drawer: Drawer(),
        body: Center(
          child: favoriteConsumer.favoriteItems.length > 0
              ? FillFavirioteScreen()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/heart.png",
                      width: getsize(context).width * 0.5,
                    ),
                    Text("لا توجد طلبات بعد", style: bold20),
                    Text("تصفح مختلف انواع الوجبات والمطاعم",
                        style: semiBold15),
                  ],
                ),
        ),
      );
    });
  }
}
