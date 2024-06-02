import 'dart:convert';

import 'package:food_receipe/core/error/server.dart';
import 'package:food_receipe/core/secrets/secret.dart';
import 'package:food_receipe/features/random_food_receipe/data/model/receipe_model.dart';
import 'package:http/http.dart';

abstract interface class DataResourceReceipe {
  Future<ReceipeModel> fetchRandomReceipe();
}

class DataResourceReceipeImp implements DataResourceReceipe {
  DataResourceReceipeImp(this.client);
  final Client client;

  @override
  Future<ReceipeModel> fetchRandomReceipe() async {
    String api = Private.spoon;
    try {
      Response response = await client.get(Uri.parse(
          "https://api.spoonacular.com/recipes/random?apiKey=$api&number=20"));
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ReceipeModel.fromJson(data);
      }
      throw ServerException("failed to fetch data");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
