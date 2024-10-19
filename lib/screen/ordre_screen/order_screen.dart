import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/order.png",
              width: getsize(context).width * 0.5,
            ),
            Text("لا توجد طلبات بعد", style: bold20),
            Text("تصفح مختلف انواع الوجبات والمطاعم", style: bold15),
          ],
        ),
      ),
    );
  }
}
