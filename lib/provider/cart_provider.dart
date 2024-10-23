import 'package:flutter/material.dart';
import 'package:kojina_project/provider/base_provider.dart';

class CartProvider extends BaseProvider {
  Map<String, int> itemList = {};

  Map<String, int> get items => itemList;

  void addItem(String productId) {
    if (itemList.containsKey(productId)) {
      itemList[productId] = itemList[productId]! + 1;
    } else {
      itemList[productId] = 1;
    }
    setBusy(true);
  }

  void removeItem(String productId) {
    if (itemList.containsKey(productId)) {
      if (itemList[productId] == 1) {
        itemList.remove(productId);
      } else {
        itemList[productId] = itemList[productId]! - 1;
      }
      setBusy(true);
    }
  }

  void clearCart() {
    itemList = {};
    setBusy(true);
  }

  int get itemCount {
    return itemList.length;
  }

  int getItemCount(String productId) {
    return itemList[productId] ?? 0;
  }
}
