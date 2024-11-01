import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../model/meal_model.dart';

class CustomCard extends StatefulWidget {
  final String mealName;
  final double price;
  final String kitchenName;
  final double rating;
  final int? discount;
  final Widget? mealpage;
  final Widget? kitchenpage;
  final int id;
  final int kitchenId;
  final String? mealDescription;
  final List<String>? ingredients;
  final String? mainIngredient;
  final dynamic mealImage;
  final String? mealType; //event or daily meal
  final String? category;

  const CustomCard(
      {required this.mealName,
      required this.price,
      required this.kitchenName,
      required this.rating,
      this.discount,
      this.mealpage,
      this.kitchenpage,
       required this.id,
      required this.kitchenId,
      this.mealDescription,
      this.ingredients,
      this.mainIngredient,
      this.mealImage,
      this.mealType,
      this.category});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
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
                      widget.mealImage,
                      height: getsize(context).height * 0.2,
                      width: getsize(context).width * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Heart Icon Positioned
                  Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                favoriteProvider.toggleFavorite(widget.id);
              },
              child: Icon(
                favoriteProvider.isFavorite(widget.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favoriteProvider.isFavorite(widget.id)
                    ? Colors.red
                    : Colors.grey,
                size: 35,
              ),
            ),
          ),
                  // Discount badge if applicable
                  if (widget.discount != null)
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
                            const Text(
                              "تخفيض",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${widget.discount}%",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
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
            child: GestureDetector(
              onTap: () {
                if (widget.kitchenpage != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => widget.kitchenpage!));
                }
                ;
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
                          Text('${widget.rating}')
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
