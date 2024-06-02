import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/features/search/data/model/search_recipe_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DomainDataRepository {
  Future<Either<SearchRecipeModel,Failure>> searchrecipe(String search);
}