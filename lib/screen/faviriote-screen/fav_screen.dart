import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/heart.png",
              width: getsize(context).width * 0.5,
            ),
            Text("لا توجد طلبات بعد", style: titleStyle),
            Text("تصفح مختلف انواع الوجبات والمطاعم", style: bodyStyle),
          ],
        ),
      ),
    );
  }
}
