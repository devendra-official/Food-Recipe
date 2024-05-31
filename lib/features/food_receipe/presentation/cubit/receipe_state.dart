part of 'receipe_cubit.dart';

@immutable
sealed class ReceipeState {}

final class ReceipeInitial extends ReceipeState {}

final class ReceipeLoading extends ReceipeState {}

final class ReceipeFailure extends ReceipeState {
  final String error;
  ReceipeFailure(this.error);
}

final class ReceipeSucess extends ReceipeState {
  final ReceipeModel receipeModel;
  ReceipeSucess(this.receipeModel);
}
