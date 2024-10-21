import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class KitchenCard extends StatefulWidget {
  final double price;
  final String imageUrl;
  final String kitchenName;
  final String rating;
  final String? mineimage;
  final String catagory;
  final Widget? kitchenpage;

  KitchenCard({
    required this.imageUrl,
    required this.kitchenName,
    required this.rating,
    required this.price,
    this.mineimage,
    required this.catagory,
    this.kitchenpage,
  });

  @override
  State<KitchenCard> createState() => _KitchenCardState();
}

class _KitchenCardState extends State<KitchenCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () {
            if (widget.kitchenpage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget.kitchenpage!),
              );
            }
          },
          child: Container(
            width: getsize(context).width * 0.9,
            height: getsize(context).height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.imageUrl,
                      height: getsize(context).height * 0.2,
                      width: getsize(context).width * 0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              child: ClipOval(
                                child: Image.asset(
                                  widget.mineimage!,
                                  width: 62,
                                  height: 62,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          SizedBox(
                            // width: getsize(context).width * 0.65,
                            child: Column(
                              children: [
                                Text(
                                  widget.kitchenName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.catagory,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: tertiaryDark),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: getsize(context).width * 0.2,
                            height: getsize(context).height * 0.04,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "مفتوح",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(kitchenName),
//                       Text("$price دينار"),
//                     ],
//                   ),
