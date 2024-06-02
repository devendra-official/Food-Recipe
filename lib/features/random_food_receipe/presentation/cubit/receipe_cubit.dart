import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_receipe/features/random_food_receipe/data/model/receipe_model.dart';
import 'package:food_receipe/features/random_food_receipe/domain/usecase/receipe_usecase.dart';

part 'receipe_state.dart';

class ReceipeCubit extends Cubit<ReceipeState> {
  ReceipeCubit(this.receipeUsecase) : super(ReceipeInitial());

  ReceipeUsecase receipeUsecase;

  Future getReceipe() async {
    emit(ReceipeLoading());
    final result = await receipeUsecase.call(ReceipeParams());
    result.fold((model) => emit(ReceipeSucess(model)),
        (failure) => emit(ReceipeFailure(failure.message)));
  }
}
