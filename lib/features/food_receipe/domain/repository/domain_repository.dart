import 'package:food_receipe/core/error/failure.dart';
import 'package:food_receipe/features/food_receipe/data/model/receipe_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DomainReceipeRepository {
  Future<Either<ReceipeModel,Failure>> fetchReceipe();
}