import 'dart:convert';

import 'package:kojina_project/model/kitchen_model.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class KitchenProvider extends BaseProvider {
  List<KitchenModel> kitchenList = [];
  List<MealModel> kitchenMeals = [];
  List<MealModel> categoryMeals = [];
  bool _isBusy = false;
  bool _hasFailed = false;

  bool get isBusy => _isBusy;
  bool get hasFailed => _hasFailed;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  void setFailed(bool value) {
    _hasFailed = value;
    notifyListeners();
  }

  //getmealsbycategory
  getMealsByCategory(String categoryName) async {
    setBusy(true);
    final response = await api.getRequest(
        "https://grand-pangolin-typically.ngrok-free.app/api/meals/category/?category=$categoryName");

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);

      categoryMeals = List<MealModel>.from(
          decodedData.map((item) => MealModel.fromJson(item)));

      notifyListeners();
    } else {
      setFailed(true);
    }
    setBusy(false);
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////

  getKitchen() async {
    setBusy(true);
    // Url of getkitchen api
    final response = await api.getRequest(
        "https://grand-pangolin-typically.ngrok-free.app/api/kitchens");

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);

      kitchenList = List<KitchenModel>.from(
          decodedData.map((item) => KitchenModel.fromJson(item)));

      notifyListeners();
    } else {
      setFailed(true);
    }
    setBusy(false);
  }

  // getKitchenMeals() async {
  //   setBusy(true);
  //   final response = await api.getRequest(
  //       "https://grand-pangolin-typically.ngrok-free.app/api/kitchens/2/meals");

  //   if (response.statusCode == 200) {
  //     var decodedData = json.decode(response.body);
  //     print(decodedData);

  //     kitchenMeals = List<Meal>.from(
  //         decodedData.map((item) => KitchenModel.fromJson(item)));

  //     notifyListeners();
  //   } else {
  //     setFailed(true);
  //   }
  //   setBusy(false);
  // }

//getmealsbykitchen
  getMealsByKitchen(int kitchenId) async {
    setBusy(true);
    final response = await api.getRequest(
        "https://grand-pangolin-typically.ngrok-free.app/api/kitchens/$kitchenId/meals");

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);

      kitchenMeals = List<MealModel>.from(
          decodedData.map((item) => MealModel.fromJson(item)));

      notifyListeners();
    } else {
      setFailed(true);
    }
    setBusy(false);
  }

  //fetch Meals
  // fetchMeals() async {
  //   setBusy(true);
  //   final response = await api.getRequest(
  //       "https://grand-pangolin-typically.ngrok-free.app/api/meals");

  //   if (response.statusCode == 200) {
  //     var decodedData = json.decode(response.body);
  //     print(decodedData);

  //     kitchenMeals =
  //         List<MealModel>.from(decodedData.map((item) => MealModel.fromJson(item)));

  //     notifyListeners();
  //   } else {
  //     setFailed(true);
  //   }
  //   setBusy(false);
  // }
}
