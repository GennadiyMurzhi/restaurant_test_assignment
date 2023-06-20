import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment_effective/domain/value_transformers.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(
          const MainLoading(currentPageIndex: 0),
        );

  Future<void> init(
    Future<void> Function(
      ImageProvider provider,
    ) precacheImage,
  ) async {
    const AssetImage userAssetImage = AssetImage('assets/images/user_image.png');
    await precacheImage(userAssetImage);

    const String location = 'Санкт-Петербург';
    final String date = formatDateTime(DateTime.now());

    emit(
      MainLoaded(
        userAssetImage: userAssetImage,
        location: location,
        date: date,
        currentPageIndex: 0,
      ),
    );
  }

  void selectPage(int selectedPageIndex) {
    emit(
      state.copyWith(
        currentPageIndex: selectedPageIndex,
        isShowCategory: false,
        categoryName: '',
      ),
    );
  }

  void switchAppBar({
    required bool switchToCategory,
    String? categoryName,
  }) {
    emit(
      state.copyWith(
        isShowCategory: switchToCategory,
        categoryName: categoryName ?? '',
      ),
    );
  }
}
