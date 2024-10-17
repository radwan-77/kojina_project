import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/cart.png",
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
