import 'package:food_receipe/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SucessType, Params> {
  Future<Either<SucessType,Failure>> call(Params param);
}
