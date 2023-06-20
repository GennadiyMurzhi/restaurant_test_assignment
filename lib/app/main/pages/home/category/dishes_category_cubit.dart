import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test_assignment_effective/domain/dish.dart';
import 'package:test_assignment_effective/domain/repository.dart';

part 'dishes_category_state.dart';

class DishesCategoryCubit extends Cubit<DishesCategoryState> {
  DishesCategoryCubit(this._repository) : super(DishesCategoryInitial());

  final Repository _repository;

  Future<void> loadDishesCategory(int categoryId) async {
    emit(DishesCategoryLoading());

    try {
      final Dishes dishes = await _repository.getDishesFromServer();

      emit(
        DishesCategoryLoaded(dishes: dishes),
      );
    } catch (e) {
      emit(DishesCategoryError());
    }
  }

  void chooseTeg({
    required Teg teg,
  }) {
    emit(
      DishesCategoryChooseTeg(
        teg: teg,
        dishes: state.dishes,
      ),
    );
  }
}
