import 'dart:convert';

class KitchenModel {
    String kitchenName;
    String phoneNumber;
    String email;
    String profileImage;
    String coverImage;
    String location;
    List<String> categories;
    String openingTime;
    String closingTime;
    String rating;
    

    KitchenModel({
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
    });

    factory KitchenModel.fromRawJson(String str) => KitchenModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory KitchenModel.fromJson(Map<String, dynamic> json) => KitchenModel(
        kitchenName: json["kitchen_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        profileImage: json["profile_image"],
        coverImage: json["cover_image"],
        location: json["location"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
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
    };
}
