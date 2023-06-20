import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assignment_effective/domain/dish.dart';

class Order extends Equatable {
  Order({
    required this.orderItems,
  }) {
    orderPrice = _decimalPrice(orderItems);
  }

  final List<OrderItem> orderItems;
  late final Decimal orderPrice;

  factory Order.empty() => Order(orderItems: List<OrderItem>.empty());

  Order addOrderItem(OrderItem orderItem) {
    final Order order;

    final int index = orderItems.indexWhere((OrderItem element) => element.dish == orderItem.dish);

    if (index != -1) {
      order = increaseItemCount(
        itemListIndex: index,
      );
    } else {
      final List<OrderItem> orderItems = List<OrderItem>.from(this.orderItems)..add(orderItem);
      order = Order(orderItems: orderItems);
    }

    return order;
  }

  Order increaseItemCount({
    required int itemListIndex,
  }) {
    final List<OrderItem> orderItems = List<OrderItem>.from(this.orderItems);
    orderItems[itemListIndex] = orderItems[itemListIndex].increase();

    return Order(orderItems: orderItems);
  }

  Order reduceItemCount({
    required int itemListIndex,
  }) {
    final List<OrderItem> orderItems = List<OrderItem>.from(this.orderItems);

    if (orderItems[itemListIndex].count == 1) {
      orderItems.removeAt(itemListIndex);
    } else {
      orderItems[itemListIndex] = orderItems[itemListIndex].reduce();
    }

    return Order(orderItems: orderItems);
  }

  int get length => orderItems.length;

  bool get isEmpty => orderItems.isEmpty;

  Decimal _decimalPrice(List<OrderItem> orderItems) {
    Decimal sumPrice = Decimal.zero;
    for (OrderItem item in orderItems) {
      for (int i = 1; i <= item.count; i++) {
        sumPrice += Decimal.parse(item.dish.price.toString());
      }
    }

    return sumPrice;
  }

  @override
  List<Object> get props => [orderItems, orderPrice];
}

class OrderItem extends Equatable {
  const OrderItem({
    required this.dish,
    int? count,
  }) : count = count ?? 1;

  final Dish dish;
  final int count;

  OrderItem increase() {
    final int count = this.count + 1;
    return OrderItem(
      dish: dish,
      count: count,
    );
  }

  OrderItem reduce() {
    final int count = this.count - 1;
    return OrderItem(
      dish: dish,
      count: count,
    );
  }

  @override
  List<Object> get props => [dish, count];
}
