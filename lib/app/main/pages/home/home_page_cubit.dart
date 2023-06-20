import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_effective/domain/category.dart';
import 'package:test_assignment_effective/domain/repository.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._repository) : super(HomePageInitial());

  final Repository _repository;

  Future<void> init() async {
    emit(HomePageLoading());

    try {
      final Categories categories = await _repository.getCategoriesFromServer();

      emit(HomePageLoaded(categories: categories));
    } catch (e) {
      emit(HomePageError(currentPageIndex: state.currentPageIndex));
    }
  }

  void onCategoryTap(int categoryListIndex) {}

  void showDishesCategory(bool isShowDishesCategory) {
    emit(
      state.copyWith(
        isShowDishesCategory: isShowDishesCategory,
      ),
    );
  }
}
