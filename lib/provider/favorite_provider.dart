import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class FavoriteProvider extends BaseProvider {
  List<int> favoriteItemIds = [];

  // This function will be used to toggle favorite status of a meal
  void toggleFavorite(int id) {
    if (favoriteItemIds.contains(id)) {
      favoriteItemIds.remove(id);
    } else {
      favoriteItemIds.add(id);
    }
    notifyListeners();
  }

  bool isFavorite(int id) {
    return favoriteItemIds.contains(id);
  }
}
