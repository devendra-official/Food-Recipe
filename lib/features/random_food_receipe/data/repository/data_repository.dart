import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/core/error/server.dart';
import 'package:food_receipe/features/random_food_receipe/data/model/receipe_model.dart';
import 'package:food_receipe/features/random_food_receipe/data/resource/data_resource.dart';
import 'package:food_receipe/features/random_food_receipe/domain/repository/domain_repository.dart';
import 'package:fpdart/fpdart.dart';

class DataRepositoryImp implements DomainReceipeRepository {
  DataRepositoryImp(this.dataResourceReceipe);
  final DataResourceReceipe dataResourceReceipe;

  @override
  Future<Either<ReceipeModel, Failure>> fetchRandomReceipe() async {
    try {
      return left(await dataResourceReceipe.fetchRandomReceipe());
    } on ServerException catch (e) {
      return right(Failure(e.message));
    }
  }
}
