import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assignment_effective/domain/dish.dart';
import 'package:test_assignment_effective/domain/order.dart';

part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial());

  void onIncreaseCount(int itemListIndex) {
    _changeItemCount(
      increase: true,
      itemListIndex: itemListIndex,
    );
  }

  void onReduceItemCount(int itemListIndex) {
    _changeItemCount(
      increase: false,
      itemListIndex: itemListIndex,
    );
  }

  void _changeItemCount({
    required bool increase,
    required itemListIndex,
  }) {
    emit(
      increase
          ? BagState(
              order: state.order.increaseItemCount(
                itemListIndex: itemListIndex,
              ),
            )
          : BagState(
              order: state.order.reduceItemCount(
                itemListIndex: itemListIndex,
              ),
            ),
    );
  }

  void addOrderItem(Dish dish) {
    emit(
      BagState(
        order: state.order.addOrderItem(
          OrderItem(dish: dish),
        ),
      ),
    );
  }
}
