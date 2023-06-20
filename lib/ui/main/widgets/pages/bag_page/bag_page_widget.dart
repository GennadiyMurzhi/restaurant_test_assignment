import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_effective/app/main/pages/bag_cubit/bag_cubit.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/bag_button_widget.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/bag_page/bag_item_widget.dart';

class BagPageWidget extends StatelessWidget {
  const BagPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double padding = 16;

    return BlocBuilder<BagCubit, BagState>(
      builder: (BuildContext context, BagState state) {
        return state.order.isEmpty
            ? Center(
                child: Text(
                  'Корзина пуста',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.order.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: padding),
                        itemBuilder: (BuildContext context, int index) {
                          return BagItemWidget(
                            orderItem: state.order.orderItems[index],
                            onIncreaseCount: () {
                              BlocProvider.of<BagCubit>(context).onIncreaseCount(index);
                            },
                            onReduceCount: () {
                              BlocProvider.of<BagCubit>(context).onReduceItemCount(index);
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: padding);
                        },
                      ),
                    ),
                    BagButtonWidget(
                      label: 'Оплатить ${state.order.orderPrice}₽',
                      padding: padding,
                      onPressed: () {},
                    ),
                  ],
                ),
              );
      },
    );
  }
}
