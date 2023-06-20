import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_assignment_effective/app/main/main_cubit.dart';
import 'package:test_assignment_effective/ui/restaurant_icons.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.location,
    required this.date,
    required this.userAssetImage,
    required this.isShowCategory,
    required this.categoryName,
  });

  final String location;
  final String date;
  final AssetImage userAssetImage;
  final bool isShowCategory;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    double userPhotoSize = 44.r;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(isShowCategory ? 16.w : 20.5.w, 8.h, 16.w, 7.h),
        child: SizedBox(
          height: 57.h,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (isShowCategory) ...[
                Positioned(
                  left: 0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 32.r,
                    icon: const Icon(
                      RestaurantIcons.arrow_back,
                    ),
                    onPressed: () {
                      BlocProvider.of<MainCubit>(context).switchAppBar(
                        switchToCategory: false,
                      );
                    },
                  ),
                ),
                Text(
                  categoryName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ] else
                Positioned(
                  left: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Icon(RestaurantIcons.location, size: 15.r),
                      ),
                      const SizedBox(width: 8.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            location,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            date,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 1.15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              Positioned(
                right: 0,
                child: Container(
                  width: userPhotoSize,
                  height: userPhotoSize,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image(
                    width: userPhotoSize,
                    height: userPhotoSize,
                    image: userAssetImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(57.h);
}
