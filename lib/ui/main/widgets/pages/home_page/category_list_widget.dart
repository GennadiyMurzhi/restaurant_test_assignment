import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/domain/category.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.categories,
  });

  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.categories.length,
      padding: EdgeInsets.symmetric(
        vertical: 8.w,
        horizontal: 16.h,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryWidget(
          category: categories.categories[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 8.h,
        );
      },
    );
  }
}
