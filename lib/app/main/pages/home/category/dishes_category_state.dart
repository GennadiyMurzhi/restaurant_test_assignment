part of 'dishes_category_cubit.dart';

@immutable
class DishesCategoryState extends Equatable {
  const DishesCategoryState({
    required this.isLoading,
    required this.teg,
    required this.dishes,
    required this.isError,
  });

  final bool isLoading;
  final Teg teg;
  final Dishes dishes;
  final bool isError;

  @override
  List<Object> get props => [isLoading, teg, dishes, isError];
}

class DishesCategoryInitial extends DishesCategoryState {
  DishesCategoryInitial()
      : super(
          isLoading: false,
          teg: Teg.all,
          dishes: Dishes.empty(),
          isError: false,
        );
}

class DishesCategoryLoading extends DishesCategoryState {
  DishesCategoryLoading()
      : super(
          isLoading: true,
          teg: Teg.all,
          dishes: Dishes.empty(),
          isError: false,
        );
}

class DishesCategoryLoaded extends DishesCategoryState {
  const DishesCategoryLoaded({
    required super.dishes,
  }) : super(
          isLoading: false,
          teg: Teg.all,
          isError: false,
        );
}

class DishesCategoryChooseTeg extends DishesCategoryState {
  const DishesCategoryChooseTeg({
    required super.teg,
    required super.dishes,
  }) : super(
          isLoading: false,
          isError: false,
        );
}

class DishesCategoryError extends DishesCategoryState {
  DishesCategoryError()
      : super(
          isLoading: false,
          teg: Teg.all,
          dishes: Dishes.empty(),
          isError: true,
        );
}
