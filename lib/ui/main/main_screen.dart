import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/app/main/main_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/home/category/dishes_category_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/home/home_page_cubit.dart';
import 'package:test_assignment_effective/injection.dart';
import 'package:test_assignment_effective/ui/main/bottom_navigation_bar_items.dart';
import 'package:test_assignment_effective/ui/main/widgets/app_bar_custom.dart';
import 'package:test_assignment_effective/ui/main/widgets/main_screen_body_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<MainCubit>(
          create: (BuildContext providerContext) => getIt<MainCubit>()
            ..init(
              (ImageProvider provider) async {
                await precacheImage(provider, context);
              },
            ),
        ),
        BlocProvider<HomePageCubit>(
          create: (BuildContext context) => getIt<HomePageCubit>()..init(),
        ),
        BlocProvider<DishesCategoryCubit>(create: (BuildContext context) => getIt<DishesCategoryCubit>()),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (BuildContext context, MainState mainState) {
          return !mainState.isLoading
              ? Scaffold(
                  appBar: AppBarCustom(
                    location: mainState.location!,
                    date: mainState.date!,
                    userAssetImage: mainState.userAssetImage!,
                    isShowCategory: mainState.isShowCategory,
                    categoryName: mainState.categoryName,
                  ),
                  body: MainScreenBodyWidget(
                    currentPageIndex: mainState.currentPageIndex,
                    isShowCategory: mainState.isShowCategory,
                  ),
                  bottomNavigationBar: SizedBox(
                    height: 68.6,
                    child: BottomNavigationBar(
                      iconSize: 24.r,
                      currentIndex: mainState.currentPageIndex,
                      onTap: BlocProvider.of<MainCubit>(context).selectPage,
                      items: bottomNavigationBarItems,
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
