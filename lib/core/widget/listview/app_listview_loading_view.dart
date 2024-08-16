import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:skeletons/skeletons.dart';

class AppListViewLoadingView extends StatelessWidget {
  const AppListViewLoadingView({super.key});

  @override
  Widget build(
    final BuildContext context,
  ) =>
      SkeletonListView(
        item: SkeletonListTile(
          verticalSpacing: 12,
          leadingStyle: const SkeletonAvatarStyle(
            width: 45,
            height: 45,
            shape: BoxShape.circle,
          ),
          titleStyle: SkeletonLineStyle(
            height: 40,
            // minLength: Get.width,
            minLength: context.width,
            randomLength: false,
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          hasSubtitle: false,
        ),
      );
}
