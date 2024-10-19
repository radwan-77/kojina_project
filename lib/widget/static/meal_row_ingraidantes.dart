import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';

class MealRowWidget extends StatefulWidget {
  final String imageUrl;
  final String mealName;
  final String? kitchenName;
  final double price;

  const MealRowWidget({
    super.key,
    required this.imageUrl,
    required this.mealName,
    this.kitchenName,
    required this.price,
  });

  @override
  _MealRowWidgetState createState() => _MealRowWidgetState();
}

class _MealRowWidgetState extends State<MealRowWidget> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: errorColor),
              ),
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mealName,
                  style: bold15,
                ),
                Row(
                  children: [
                    Text(
                      widget.kitchenName ?? "",
                      style: normal12,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.price} د.ل",
                      style: normal12,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 5,
          bottom: 5,
          top: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
              Text(
                counter.toString(),
                style: semiBold20,
              ),
              IconButton(
                onPressed: () {
                  if (counter > 1) {
                    setState(() {
                      counter -= 1;
                    });
                  }
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
