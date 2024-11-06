import 'dart:convert';

class MealModel {
  int id;
  int kitchenId;
  String kitchenName;
  String mealName;
  String mealDescription;
  List<String>? ingredients;
  String? mainIngredient;
  String? mealImage;
  double price;
  double rating;
  String? mealType;
  String? category;
  double? discount;
  DateTime? createdAt;
  DateTime? updatedAt;

  MealModel({
    required this.id,
    required this.kitchenId,
    required this.kitchenName,
    required this.mealName,
    required this.mealDescription,
    this.ingredients,
    this.mainIngredient,
    required this.mealImage,
    required this.price,
    required this.rating,
    this.mealType,
    required this.category,
    required this.discount,
    this.createdAt,
    this.updatedAt,
  });

  factory MealModel.fromRawJson(String str) =>
      MealModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        id: json["id"],
        kitchenId: json["kitchen_id"],
        kitchenName: json["kitchen_name"],
        mealName: json["meal_name"],
        mealDescription: json["meal_description"],
        rating: json["rating"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        mainIngredient: json["main_ingredient"],
        mealImage: json["meal_image"],
        price: json["price"],
        mealType: json["meal_type"],
        category: json["category"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kitchen_id": kitchenId,
        "meal_name": mealName,
        "kitchen_name": kitchenName,
        "meal_description": mealDescription,
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "main_ingredient": mainIngredient,
        "meal_image": mealImage,
        "price": price,
        "rating": rating,
        "meal_type": mealType,
        "category": category,
        "discount": discount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
