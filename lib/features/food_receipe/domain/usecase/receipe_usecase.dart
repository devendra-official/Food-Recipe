import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/core/usecase/usecase.dart';
import 'package:food_receipe/features/food_receipe/data/model/receipe_model.dart';
import 'package:food_receipe/features/food_receipe/domain/repository/domain_repository.dart';
import 'package:fpdart/fpdart.dart';

class ReceipeUsecase implements Usecase<ReceipeModel, ReceipeParams> {
  DomainReceipeRepository domainReceipeRepository;
  ReceipeUsecase(this.domainReceipeRepository);

  @override
  Future<Either<ReceipeModel, Failure>> call(ReceipeParams param) async {
    return await domainReceipeRepository.fetchReceipe();
  }
}

class ReceipeParams {}
