import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class FavoriteProvider extends BaseProvider {
  List<Meal> _favoriteItems = [];

  List<Meal> get favoriteItems => _favoriteItems;

  void toggleFavorite(Meal itemId) {
    if (_favoriteItems.contains(itemId)) {
      _favoriteItems.remove(itemId);
    } else {
      _favoriteItems.add(itemId);
    }
    setBusy(false);
  }

  bool isFavorite(Meal itemId) {
    return _favoriteItems.contains(itemId);
  }
}
