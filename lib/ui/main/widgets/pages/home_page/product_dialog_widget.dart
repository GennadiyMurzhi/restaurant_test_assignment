import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_effective/app/main/pages/bag_cubit/bag_cubit.dart';
import 'package:test_assignment_effective/domain/dish.dart';
import 'package:test_assignment_effective/ui/image_frame_builder.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/bag_button_widget.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/product_dialog_button_widget.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/price_weight_widget.dart';
import 'package:test_assignment_effective/ui/restaurant_icons.dart';

class ProductDialogWidget extends StatelessWidget {
  const ProductDialogWidget({
    super.key,
    required this.dish,
  });

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    const double dialogButtonPadding = 8;
    const double elementInnerPadding = 8;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: padding),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFF8F7F5),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 56),
                    child: Image.network(
                      dish.imageUrl,
                      height: 204,
                      frameBuilder: imageFrameBuilder,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(dialogButtonPadding),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ProductDialogButtonWidget(
                            onPressed: () {},
                            iconData: RestaurantIcons.like,
                          ),
                          const SizedBox(width: dialogButtonPadding),
                          ProductDialogButtonWidget(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            iconData: RestaurantIcons.dismiss,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: elementInnerPadding),
            Text(
              dish.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: elementInnerPadding),
            PriceWeightWidget(
              price: dish.price,
              weight: dish.weight,
            ),
            const SizedBox(height: elementInnerPadding),
            Text(
              dish.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: elementInnerPadding),
            BagButtonWidget(
              label: 'Добавить в корзину',
              onPressed: () {
                BlocProvider.of<BagCubit>(context).addOrderItem(dish);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
