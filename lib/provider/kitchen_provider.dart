import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kojina_project/model/kitchen_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class KitchenProvider extends BaseProvider {
  List<KitchenModel> kitchenList = [];

  getKitchen() async{
    setBusy(true);
    // Url of getkitchen api
    final response = await api.getRequest("");
  
    if (response.statusCode == 200) {
      setFailed(false);

      var decodedData = json.decode(response.body)['data'];
      // for (var x in decodedData) {
      //   kitchenList.add(KitchenModel.fromJson(x));
      // }
      kitchenList = List<KitchenModel>.from(
          decodedData.map((item) => KitchenModel.fromJson(item))).toList();
    } else {
      setFailed(true);
    }
  }
 
}