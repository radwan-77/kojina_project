class Meal {
  final int itemId;
  final String mealName;
  final String imageUrl;
  final String kitchenName;
  final String rating;
  final double price;

  Meal({
    required this.itemId,
    required this.mealName,
    required this.imageUrl,
    required this.kitchenName,
    required this.rating,
    required this.price,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      itemId: json['itemId'],
      mealName: json['mealName'],
      imageUrl: json['imageUrl'],
      kitchenName: json['kitchenName'],
      rating: json['rating'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'mealName': mealName,
      'imageUrl': imageUrl,
      'kitchenName': kitchenName,
      'rating': rating,
      'price': price,
    };
  }
}
