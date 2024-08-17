import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/app/app_assets.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/domain/entities/hamdars.dart';
import 'package:skeletons/skeletons.dart';

class ListItemWidget extends StatelessWidget {
  final HamdarsQUnitLearningContentDtos? item;
  final bool isLoading;

  const ListItemWidget({
    super.key,
    this.item,
    this.isLoading = false,
  });

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: 64.h,
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0x26000000),
                  width: 6.w,
                ),
              ),
              child: Container(
                width: 30.w,
                height: 30.w,
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFEDEDED),
                    width: 4.w,
                  ),
                ),
                child: !isLoading &&
                        item != null &&
                        item!.hamdarsQUnitLearningContentTypeIcon != null
                    ? SvgPicture.network(
                        item!.hamdarsQUnitLearningContentTypeIcon!,
                        placeholderBuilder: (final BuildContext context) =>
                            SvgPicture.asset(
                          AppAssets.fasl,
                        ),
                        colorFilter: ColorFilter.mode(
                          (item!.hamdarsQUnitLearningContentTypeColor ?? "")
                              .toColor(),
                          BlendMode.srcIn,
                        ),
                        alignment: Alignment.center,
                      )
                    : SvgPicture.asset(
                        AppAssets.fasl,
                      ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: 12.w,
                  left: 12.w,
                  top: 7.h,
                  bottom: 7.h,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0x14758BEB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: isLoading || item == null
                    ? SkeletonLine(
                        style: SkeletonLineStyle(
                          alignment: Alignment.topRight,
                          height: 16.h,
                          width: 64.w,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item!.hamdarsQUnitLearningContentTypeDesc ?? '',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xFF404040),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.duration,
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    0.toStudyTime(),
                                    // item.hamdarsQUnitLearningContentTypeIcon.toStudyTime(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: const Color(0xFF404040),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          RotatedBox(
                            quarterTurns: context.isDirectionRTL() ? 0 : 2,
                            child: SvgPicture.asset(
                              AppAssets.back,
                              width: 12.w,
                              height: 12.w,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      );
}
