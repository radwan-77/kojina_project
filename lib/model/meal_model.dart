class Meal {
  final String mealName;
  final String imageUrl;
  final String kitchenName;
  final String rating;
  final double price;
  // final String? Description;

  Meal({
    required this.mealName,
    required this.imageUrl,
    required this.kitchenName,
    required this.rating,
    required this.price,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      mealName: json['mealName'],
      imageUrl: json['imageUrl'],
      kitchenName: json['kitchenName'],
      rating: json['rating'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealName': mealName,
      'imageUrl': imageUrl,
      'kitchenName': kitchenName,
      'rating': rating,
      'price': price,
    };
  }
}