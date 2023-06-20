import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_effective/app/main/pages/home/home_page_cubit.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/category_list_widget.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/dishes_category_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    super.key,
    required this.isShowCategory,
  });

  final bool isShowCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (BuildContext context, HomePageState state) {
        return !isShowCategory
            ? !state.isLoading
                ? CategoryListWidget(
                    categories: state.categories,
                  )
                : const SizedBox()
            : const DishesCategoryWidget();
      },
    );
  }
}
