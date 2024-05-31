import 'dart:convert';

import 'package:food_receipe/core/error/server.dart';
import 'package:food_receipe/features/food_receipe/data/model/receipe_model.dart';
import 'package:http/http.dart';

abstract interface class DataResourceReceipe {
  Future<ReceipeModel> fetchReceipe();
}

class DataResourceReceipeImp implements DataResourceReceipe {
  DataResourceReceipeImp(this.client);
  final Client client;

  @override
  Future<ReceipeModel> fetchReceipe() async {
    try {
      Response response = await client.get(Uri.parse("http://localhost:8080"));
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data.runtimeType);
        return ReceipeModel.fromJson(data);
      }
      throw ServerException("Server error");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
