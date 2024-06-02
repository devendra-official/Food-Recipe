import 'dart:convert';

import 'package:food_receipe/core/error/server.dart';
import 'package:food_receipe/core/secrets/secret.dart';
import 'package:food_receipe/features/search/data/model/search_recipe_model.dart';
import 'package:http/http.dart';

abstract interface class DataResource {
  Future<SearchRecipeModel> searchrecipe(String search);
}

class DataResourceImp implements DataResource {
  DataResourceImp(this.client);
  final Client client;

  @override
  Future<SearchRecipeModel> searchrecipe(String search)async {
    try {
      String api = Private.spoon;
      Response response = await client.get(Uri.parse("https://api.spoonacular.com/recipes/complexSearch?query=$search&apiKey=$api"));
      if(response.statusCode==200){
        return SearchRecipeModel.fromJson(jsonDecode(response.body));
      }
      throw ServerException("failed to get search recipe");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
