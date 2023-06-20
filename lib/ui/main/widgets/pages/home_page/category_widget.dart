import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/app/main/main_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/home/category/dishes_category_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/home/home_page_cubit.dart';
import 'package:test_assignment_effective/domain/category.dart';
import 'package:test_assignment_effective/ui/image_frame_builder.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final double itemBorderRadius = 10.r;

    return Stack(
      children: <Widget>[
        Positioned(
          child: SizedBox(
            width: double.maxFinite,
            height: 148.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(itemBorderRadius),
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
                frameBuilder: imageFrameBuilder,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 136.w, 0),
          child: Text(
            category.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(itemBorderRadius),
              onTap: () {
                BlocProvider.of<MainCubit>(context).switchAppBar(
                  switchToCategory: true,
                  categoryName: category.name,
                );
                BlocProvider.of<HomePageCubit>(context).showDishesCategory(true);
                BlocProvider.of<DishesCategoryCubit>(context).loadDishesCategory(category.id);
              },
            ),
          ),
        ),
      ],
    );
  }
}
