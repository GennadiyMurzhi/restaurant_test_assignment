import 'package:flutter/material.dart';
import 'package:test_assignment_effective/domain/order.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/bag_page/increase_reduce_button_widget.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/price_weight_widget.dart';
import 'package:test_assignment_effective/ui/restaurant_icons.dart';

class BagItemWidget extends StatelessWidget {
  const BagItemWidget({
    super.key,
    required this.orderItem,
    required this.onIncreaseCount,
    required this.onReduceCount,
  });

  final OrderItem orderItem;
  final void Function() onIncreaseCount;
  final void Function() onReduceCount;

  @override
  Widget build(BuildContext context) {
    const double imageContainerSize = 62;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: imageContainerSize,
          height: imageContainerSize,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color(0xFFF8F7F5),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Image.network(
            orderItem.dish.imageUrl,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              orderItem.dish.name,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w400),
            ),
            PriceWeightWidget(
              price: orderItem.dish.price,
              weight: orderItem.dish.weight,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 100,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFEFEEEC),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IncreaseReduceButtonWidget(
                onTap: onReduceCount,
                iconData: RestaurantIcons.delete,
              ),
              Text(
                orderItem.count.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              IncreaseReduceButtonWidget(
                onTap: onIncreaseCount,
                iconData: RestaurantIcons.add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
