import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class MealsProvider  extends BaseProvider
{
  List<Meal> meals = [
    Meal(
        itemId: 1,
        mealName: "وجبة العرجيعة",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ جميرا",
        rating: "4",
        price: 35),
    Meal(
        itemId: 2,
        mealName: "وجبة الكبسة",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ الرياض",
        rating: "5",
        price: 40),
    Meal(
        itemId: 3,
        mealName: "وجبة المندي",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ صنعاء",
        rating: "4.5",
        price: 45),
    Meal(
        itemId: 4,
        mealName: "وجبة الشاورما",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ دمشق",
        rating: "4",
        price: 30),
    Meal(
        itemId: 5,
        mealName: "وجبة البرجر",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ نيويورك",
        rating: "4.2",
        price: 50),
    Meal(
        itemId: 6,
        mealName: "وجبة السوشي",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ طوكيو",
        rating: "4.8",
        price: 60),
    Meal(
        itemId: 7,
        mealName: "وجبة البيتزا",
        imageUrl: "assets/meal1.png",
        kitchenName: "مطبخ روما",
        rating: "4.3",
        price: 55),
  ];
}