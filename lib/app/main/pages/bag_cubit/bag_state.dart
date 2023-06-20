part of 'bag_cubit.dart';

class BagState extends Equatable {
  const BagState({
    required this.order,
  });

  final Order order;

  @override
  List<Object> get props => [order];
}

class BagInitial extends BagState {
  BagInitial()
      : super(
          order: Order.empty(),
        );
}
