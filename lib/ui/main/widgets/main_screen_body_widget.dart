import 'package:flutter/cupertino.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/bag_page/bag_page_widget.dart';
import 'package:test_assignment_effective/ui/main/widgets/pages/home_page/home_page_widget.dart';

class MainScreenBodyWidget extends StatelessWidget {
  const MainScreenBodyWidget({
    super.key,
    required this.currentPageIndex,
    required this.isShowCategory,
  });

  final int currentPageIndex;
  final bool isShowCategory;

  @override
  Widget build(BuildContext context) {
    switch (currentPageIndex) {
      case 0:
        return HomePageWidget(
          isShowCategory: isShowCategory,
        );
      case 2:
        return const BagPageWidget();
      default:
        return const SizedBox();
    }
  }
}
