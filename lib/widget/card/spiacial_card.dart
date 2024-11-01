import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/model/meal_model.dart';

class SpiacialCard extends StatefulWidget {
  final String mealName;
  final double price;
  final String kitchenName;
  final double rating;
  final int? discount;
  final Widget? mealpage;
  final Widget? kitchenpage;
  final int? id;
  final int kitchenId;
  final String? mealDescription;
  final List<String>? ingredients;
  final String? mainIngredient;
  final dynamic mealImage;
  final String? mealType; //event or daily meal
  final String? category;
  // Add itemId to constructor for unique identification

  const SpiacialCard({
    super.key,
    required this.mealName,
    required this.price,
    required this.kitchenName,
    required this.rating,
    this.discount,
    this.mealpage,
    this.kitchenpage,
    this.id,
    required this.kitchenId,
    this.mealDescription,
    this.ingredients,
    this.mainIngredient,
    this.mealImage,
    this.mealType,
    this.category,
  });

  @override
  State<SpiacialCard> createState() => _SpiacialCardState();
}

class _SpiacialCardState extends State<SpiacialCard> {
  var isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          print(isSelected);
        },
        child: Container(
          width: getsize(context).width * 0.46,
          height: getsize(context).height * 0.6,
          decoration: BoxDecoration(
            color: onPrimaryDark,

            borderRadius: BorderRadius.circular(10),
            // border:
            border: isSelected
                ? Border.all(
                    color: mainColor,
                    width: 3,
                  )
                : null,

            // isSelected ? border : null,
            // isSelected ? Border.all(color: Colors.red, width: 2) : null,

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
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.asset(
                      widget.mealImage,
                      width: getsize(context).width * 0.45,
                      height: getsize(context).height * 0.15,
                      fit: BoxFit.cover,
                    ),
                    // Heart Icon Positioned

                    // Discount badge if applicable
                    if (widget.discount != null)
                      Positioned(
                        right: 10,
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
                              Text("تخفيض", style: normal12),
                              Text("${widget.discount}%", style: normal15),
                            ],
                          ),
                        ),
                      ),
                  ],
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
                        Text(widget.mealName, style: bold12),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Color(0xFFFFD233), size: 20),
                            Text(
                              '${widget.rating}',
                              style: normal12,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.kitchenName,
                          style: normal10,
                        ),
                        Text(
                          "${widget.price}",
                          style: normal10,
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
    );
  }
}
