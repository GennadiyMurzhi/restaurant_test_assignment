import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/domain/dish.dart';
import 'package:test_assignment_effective/ui/image_frame_builder.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/product_dialog_widget.dart';

class DishWidget extends StatelessWidget {
  const DishWidget({
    super.key,
    required this.dish,
    required this.padding,
    required this.itemDishSize,
  });

  final Dish dish;
  final EdgeInsets padding;
  final double itemDishSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: padding,
          child: SizedBox(
            width: itemDishSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  key: UniqueKey(),
                  dish.imageUrl,
                  height: itemDishSize.h,
                  frameBuilder: imageFrameBuilder,
                ),
                const SizedBox(height: 5),
                Text(
                  dish.name,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ProductDialogWidget(
                    dish: dish,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
