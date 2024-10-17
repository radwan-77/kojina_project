import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class CustomCard extends StatelessWidget {
  final String mealName;
  final double price;
  final String imageUrl;
  final String kitchenName;
  final String rating;

  CustomCard({
    required this.imageUrl,
    required this.kitchenName,
    required this.rating,
    required this.price,
    required this.mealName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getsize(context).width * 0.6,
      height: getsize(context).height * 0.7,
      margin: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    height: getsize(context).height * 0.2,
                    width: getsize(context).width * 0.7,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "تخفيض",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "50%",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mealName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFFD233), size: 22),
                        Text(rating)
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(kitchenName),
                    Text("$price دينار"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
