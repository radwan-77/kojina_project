import 'dart:convert';

class KitchenModel {
  int id;
  String kitchenName;
  String phoneNumber;
  String email;
  String profileImage;
  String coverImage;
  String location;
  List<String> categories;
  int openingTime;
  int closingTime;
  double rating;
  DateTime createdAt;
  DateTime updatedAt;

  KitchenModel({
    required this.id,
    required this.kitchenName,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
    required this.coverImage,
    required this.location,
    required this.categories,
    required this.openingTime,
    required this.closingTime,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KitchenModel.fromRawJson(String str) =>
      KitchenModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KitchenModel.fromJson(Map<String, dynamic> json) => KitchenModel(
        id: json["id"],
        kitchenName: json["kitchen_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        profileImage: json["profile_image"],
        coverImage: json["cover_image"],
        location: json["location"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        rating: json["rating"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kitchen_name": kitchenName,
        "phone_number": phoneNumber,
        "email": email,
        "profile_image": profileImage,
        "cover_image": coverImage,
        "location": location,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "opening_time": openingTime,
        "closing_time": closingTime,
        "rating": rating,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
