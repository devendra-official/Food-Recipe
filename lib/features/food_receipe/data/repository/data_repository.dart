import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/core/error/server.dart';
import 'package:food_receipe/features/food_receipe/data/model/receipe_model.dart';
import 'package:food_receipe/features/food_receipe/data/resource/data_resource.dart';
import 'package:food_receipe/features/food_receipe/domain/repository/domain_repository.dart';
import 'package:fpdart/fpdart.dart';

class DataRepositoryImp implements DomainReceipeRepository {
  DataRepositoryImp(this.dataResourceReceipe);
  final DataResourceReceipe dataResourceReceipe;

  @override
  Future<Either<ReceipeModel, Failure>> fetchReceipe() async {
    try {
      return left(await dataResourceReceipe.fetchReceipe());
    } on ServerException catch (e) {
      return right(Failure(e.message));
    }
  }
}
