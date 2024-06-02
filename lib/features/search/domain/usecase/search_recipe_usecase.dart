import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/core/usecase/usecase.dart';
import 'package:food_receipe/features/search/data/model/search_recipe_model.dart';
import 'package:food_receipe/features/search/domain/repository/domain_data_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchRecipeUsecase
    implements Usecase<SearchRecipeModel, SearchRecipeParam> {
  DomainDataRepository domainDataRepository;
  SearchRecipeUsecase(this.domainDataRepository);
  @override
  Future<Either<SearchRecipeModel, Failure>> call(
      SearchRecipeParam param) async {
    return await domainDataRepository.searchrecipe(param.search);
  }
}

class SearchRecipeParam {
  SearchRecipeParam(this.search);
  final String search;
}
