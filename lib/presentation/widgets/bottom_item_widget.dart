import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/app/app_assets.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:skeletons/skeletons.dart';

class BottomItemWidget extends StatefulWidget {
  final String title;
  final num progress;
  final String iconPath;
  final int level;
  final int studyTime;
  final bool isSelected;
  final bool isLoading;

  const BottomItemWidget({
    super.key,
    required this.title,
    required this.progress,
    required this.iconPath,
    required this.level,
    required this.studyTime,
    required this.isSelected,
    this.isLoading = false,
  });

  @override
  State<BottomItemWidget> createState() => _BottomItemWidgetState();
}

class _BottomItemWidgetState extends State<BottomItemWidget> {
  final Duration duration = const Duration(milliseconds: 300);
  final Curve curve = Curves.easeInOut;

  @override
  Widget build(
    final BuildContext context,
  ) =>
      TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: widget.isSelected ? 0.8 : 0.6,
          end: widget.isSelected ? 1.0 : 0.6,
        ),
        duration: duration,
        curve: curve,
        builder: (
          final BuildContext context,
          final double scale,
          final Widget? child,
        ) =>
            Transform.scale(
          scale: scale,
          child: child,
        ),
        child: AnimatedContainer(
          duration: duration,
          curve: curve,
          width: 88.w,
          height: 168.h,
          decoration: widget.isSelected
              ? ShapeDecoration(
                  color: const Color(0x14758BEB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44.r),
                      topRight: Radius.circular(44.r),
                    ),
                  ),
                )
              : null,
          child: Column(
            children: [
              AnimatedContainer(
                duration: duration,
                curve: curve,
                width: 88.w,
                height: 88.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 81.w,
                      height: 81.w,
                      child: CircularProgressIndicator(
                        value: widget.progress.toDouble(),
                        color: const Color(0xFF758BEB),
                        backgroundColor: const Color(0xFFEDEDED),
                        strokeWidth: 7,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    widget.isLoading
                        ? Container(
                            width: widget.isSelected ? 73.w : 66.w,
                            height: widget.isSelected ? 73.w : 66.w,
                            margin: EdgeInsets.all(4.w),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF0F0F0),
                            ),
                          )
                        : SvgPicture.network(
                            widget.iconPath,
                            width: widget.isSelected ? 73.w : 66.w,
                            height: widget.isSelected ? 73.w : 66.w,
                            placeholderBuilder: (final BuildContext context) =>
                                SvgPicture.asset(
                              AppAssets.fasl,
                            ),
                          ),
                  ],
                ),
              ),
              if (widget.isSelected) ...[
                SizedBox(height: 4.h),
                if (widget.isLoading) ...[
                  SizedBox(height: 8.h),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      alignment: Alignment.center,
                      height: 20.h,
                      width: 68.w,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ] else ...[
                  Container(
                    // width: 33.w,
                    // height: 14.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFFC107),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${S.of(context).level} ${widget.level}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 8.h),
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
                        widget.studyTime.toStudyTime(),
                        textAlign: TextAlign.right,
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
              ],
            ],
          ),
        ),
      );
}
