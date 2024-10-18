import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class KitchenCard extends StatelessWidget {
  final double price;
  final String imageUrl;
  final String kitchenName;
  final String rating;
  final String mineimage;
  final String catagory;
  final Widget? kitchenpage;

  KitchenCard({
    required this.imageUrl,
    required this.kitchenName,
    required this.rating,
    required this.price,
    required this.mineimage,
    required this.catagory, this.kitchenpage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => kitchenpage!)),
          child: Container(
            width: getsize(context).width,
            height: getsize(context).height * 0.3,
            margin: const EdgeInsets.only(
              right: 25,
              left: 25,
            ),
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
                      imageUrl,
                      height: getsize(context).height * 0.2,
                      width: getsize(context).width * 0.9,
                      fit: BoxFit.cover,
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: ClipOval(
                                child: Image.asset(
                                  mineimage,
                                  width: 62,
                                  height: 62,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // width: 70,
                              // height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          Container(
                            width: getsize(context).width * 0.65,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      kitchenName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      catagory,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: tertiaryDark),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Color(0xFFFFD233), size: 22),
                                        Text(rating)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
