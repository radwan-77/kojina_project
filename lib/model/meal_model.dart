import 'dart:convert';

class MealModel {
  int id;
  int kitchenId;
  String kitchenName;
  String mealName;
  String mealDescription;
  List<String> ingredients;
  String mealImage;
  double price;
  String category;
  double rating;
  dynamic discount;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? mealType;
  String? mainIngredient;

  MealModel({
    required this.rating,
    required this.kitchenName,
    required this.id,
    required this.kitchenId,
    required this.mealName,
    required this.mealDescription,
    required this.ingredients,
    this.mainIngredient,
    required this.mealImage,
    required this.price,
    this.mealType,
    required this.category,
    this.discount,
    this.createdAt,
    this.updatedAt,
  });

  factory MealModel.fromRawJson(String str) =>
      MealModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        id: json["id"],
        kitchenName: json["kitch_name"],
        kitchenId: json["kitchen_id"],
        mealName: json["meal_name"],
        mealDescription: json["meal_description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        mainIngredient: json["main_ingredient"],
        mealImage: json["meal_image"],
        price: json["price"],
        rating: json["rating"],
        mealType: json["meal_type"],
        category: json["category"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kitchenName": kitchenName,
        "kitchen_id": kitchenId,
        "meal_name": mealName,
        "meal_description": mealDescription,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
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
