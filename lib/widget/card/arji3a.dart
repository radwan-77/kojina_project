import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class CustomCard extends StatefulWidget {
  final String mealName;
  final double price;
  final String imageUrl;
  final String kitchenName;
  final String rating;
  final int? discount;
  final String? description;
  final Widget? mealpage;
  final Widget? kitchenpage;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.kitchenName,
    required this.rating,
    required this.price,
    required this.mealName,
    this.discount,
    this.description,
    this.mealpage,
    this.kitchenpage,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isSlected = false;
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
                  GestureDetector(
                    onTap: () {
                      if (widget.mealpage != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => widget.mealpage!));
                      }
                    },
                    child: Image.asset(
                      widget.imageUrl,
                      height: getsize(context).height * 0.2,
                      width: getsize(context).width * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSlected = !isSlected;
                      });
                    },
                    child: Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: isSlected
                            ? const Icon(
                                Icons.favorite,
                                color: mainColor,
                                size: 50,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: mainColor,
                                size: 50,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: widget.discount != null
                          ? Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "تخفيض",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Text(
                                    "${widget.discount}%",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (widget.kitchenpage != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => widget.kitchenpage!));
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.mealName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Color(0xFFFFD233), size: 22),
                          Text(widget.rating)
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.kitchenName),
                      Text("${widget.price} دينار"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
