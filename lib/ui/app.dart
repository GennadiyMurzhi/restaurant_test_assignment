import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/app/main/pages/bag_cubit/bag_cubit.dart';
import 'package:test_assignment_effective/injection.dart';
import 'package:test_assignment_effective/ui/main/main_screen.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        ScreenUtil.init(context);

        return BlocProvider<BagCubit>(
          create: (context) => getIt<BagCubit>(),
          child: MaterialApp(
            title: 'Restaurant App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              textTheme: TextTheme(
                headlineMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                  letterSpacing: 0,
                ),
                headlineSmall: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  letterSpacing: 0,
                ),
                titleLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 1.05,
                  letterSpacing: 0,
                ),
                titleSmall: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.05,
                  letterSpacing: 0,
                ),
                bodyMedium: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.65),
                  height: 1.1,
                  letterSpacing: 0,
                ),
                labelLarge: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Colors.white,
                  height: 1.1,
                  letterSpacing: 0,
                ),
                labelSmall: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                  height: 1.05,
                  letterSpacing: 0,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                elevation: 11.h,
                selectedItemColor: const Color(0xFF3364E0),
                unselectedItemColor: const Color(0xFFA5A9B2),
                selectedLabelStyle: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  height: 1.1,
                  letterSpacing: 0,
                ),
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFF8F7F5)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 16.w,
                    ),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              useMaterial3: false,
            ),
            home: const MainScreen(),
          ),
        );
      },
    );
  }
}
