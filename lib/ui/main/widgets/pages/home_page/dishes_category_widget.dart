import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/app/main/pages/home/category/dishes_category_cubit.dart';
import 'package:test_assignment_effective/domain/dish.dart';
import 'package:test_assignment_effective/domain/value_transformers.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/dish_widget.dart';

class DishesCategoryWidget extends StatelessWidget {
  const DishesCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double dishesPadding = 16;
    const double dishesSpacing = 8;
    final double itemDishSize = (MediaQuery.of(context).size.width - (dishesPadding + dishesSpacing) * 2) / 3 - 0.01;

    final double dishesPaddingWidth = 16.w;
    return BlocBuilder<DishesCategoryCubit, DishesCategoryState>(
      builder: (BuildContext context, DishesCategoryState state) {
        final Dishes dishes = state.dishes.byTeg(state.teg);

        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.maxFinite,
                height: 35.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: Teg.values.length,
                  padding: EdgeInsets.symmetric(horizontal: dishesPaddingWidth),
                  itemBuilder: (BuildContext context, int index) {
                    return OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Teg.values[index] == state.teg ? const Color(0xFF3364E0) : const Color(0xFFF8F7F5),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<DishesCategoryCubit>(context).chooseTeg(
                          teg: Teg.values[index],
                        );
                      },
                      child: Text(
                        translateTeg(Teg.values[index]),
                        style: Teg.values[index] == state.teg
                            ? Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white)
                            : Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
              if (!state.isLoading)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: dishesPadding),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: dishesSpacing,
                          children: List<Widget>.generate(
                            dishes.dishes.length,
                            (index) => DishWidget(
                              dish: dishes.dishes[index],
                              padding: EdgeInsets.only(
                                left: index == 0 || (index) % 3 == 0 ? dishesPadding : 0,
                                right: (index + 1) % 3 == 0 ? dishesPadding : 0,
                              ),
                              itemDishSize: itemDishSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
