import 'dart:convert';

class UserModel {
    String fullName;
    String phoneNumber;
    String email;
    String password;

    UserModel({
        required this.fullName,
        required this.phoneNumber,
        required this.email,
        required this.password,
    });

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone_number": phoneNumber,
        "email": email,
        "password": password,
    };
}
