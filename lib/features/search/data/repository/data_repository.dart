import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/core/error/server.dart';
import 'package:food_receipe/features/search/data/model/search_recipe_model.dart';
import 'package:food_receipe/features/search/data/resource/data_resource.dart';
import 'package:food_receipe/features/search/domain/repository/domain_data_repository.dart';
import 'package:fpdart/fpdart.dart';

class DataRepository implements DomainDataRepository {
  DataRepository(this.dataResource);
  final DataResource dataResource;
  @override
  Future<Either<SearchRecipeModel, Failure>> searchrecipe(String search) async {
    try {
      return left(await dataResource.searchrecipe(search));
    } on ServerException catch (e) {
      return right(Failure(e.message));
    }
  }
}
