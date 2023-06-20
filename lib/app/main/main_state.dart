part of 'main_cubit.dart';

@immutable
class MainState extends Equatable {
  const MainState({
    required this.userAssetImage,
    required this.location,
    required this.date,
    required this.currentPageIndex,
    required this.isShowCategory,
    required this.categoryName,
    required this.isLoading,
  });

  final AssetImage? userAssetImage;
  final String? location;
  final String? date;
  final int currentPageIndex;
  final bool isShowCategory;
  final String categoryName;
  final bool isLoading;

  MainState copyWith({
    AssetImage? userAssetImage,
    String? location,
    String? date,
    int? currentPageIndex,
    bool? isShowCategory,
    String? categoryName,
    bool? isLoading,
  }) =>
      MainState(
        userAssetImage: userAssetImage ?? this.userAssetImage,
        location: location ?? this.location,
        date: date ?? this.date,
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        isShowCategory: isShowCategory ?? this.isShowCategory,
        categoryName: categoryName ?? this.categoryName,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [currentPageIndex, isShowCategory, categoryName, isLoading];
}

class MainLoading extends MainState {
  const MainLoading({
    required super.currentPageIndex,
  }) : super(
          userAssetImage: null,
          location: null,
          date: null,
          isLoading: true,
          isShowCategory: false,
          categoryName: '',
        );
}

class MainLoaded extends MainState {
  const MainLoaded({
    required super.userAssetImage,
    required super.location,
    required super.date,
    required super.currentPageIndex,
  }) : super(
          isLoading: false,
          isShowCategory: false,
          categoryName: '',
        );
}
