part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  const HomePageState({
    required this.isLoading,
    required this.categories,
    required this.currentPageIndex,
    required this.isShowDishesCategory,
    required this.isError,
  });

  final bool isLoading;
  final Categories categories;
  final int currentPageIndex;
  final bool isShowDishesCategory;
  final bool isError;

  HomePageState copyWith({
    bool? isLoading,
    Categories? categories,
    int? currentPageIndex,
    bool? isShowDishesCategory,
    bool? isError,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        categories: categories ?? this.categories,
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        isShowDishesCategory: isShowDishesCategory ?? this.isShowDishesCategory,
        isError: isError ?? this.isError,
      );

  @override
  List<Object?> get props => [
        isLoading,
        categories,
        currentPageIndex,
        isShowDishesCategory,
        isError,
      ];
}

class HomePageInitial extends HomePageState {
  HomePageInitial()
      : super(
          isLoading: false,
          categories: Categories.empty(),
          currentPageIndex: 0,
          isShowDishesCategory: false,
          isError: false,
        );
}

class HomePageLoading extends HomePageState {
  HomePageLoading()
      : super(
          isLoading: true,
          categories: Categories.empty(),
          currentPageIndex: 0,
          isShowDishesCategory: false,
          isError: false,
        );
}

class HomePageLoaded extends HomePageState {
  const HomePageLoaded({
    required super.categories,
  }) : super(
          isLoading: false,
          currentPageIndex: 0,
          isShowDishesCategory: false,
          isError: false,
        );
}

class HomePageError extends HomePageState {
  HomePageError({
    required super.currentPageIndex,
  }) : super(
          isLoading: false,
          categories: Categories.empty(),
          isShowDishesCategory: false,
          isError: true,
        );
}
