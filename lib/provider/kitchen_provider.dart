import 'dart:convert';

import 'package:kojina_project/model/kitchen_model.dart';
import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class KitchenProvider extends BaseProvider {
  List<KitchenModel> kitchenList = [];
  List<Meal> kitchenMeals = [];

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

  getKitchenMeals() async {
    setBusy(true);
    final response = await api.getRequest(
        "https://grand-pangolin-typically.ngrok-free.app/api/kitchens/2/meals");

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);

      kitchenMeals = List<Meal>.from(
          decodedData.map((item) => KitchenModel.fromJson(item)));

      notifyListeners();
    } else {
      setFailed(true);
    }
    setBusy(false);
  }
}
