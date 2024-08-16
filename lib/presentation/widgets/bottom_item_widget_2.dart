import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/generated/l10n.dart';

class BottomItemWidget extends StatelessWidget {
  final String title;
  final num progress;
  final String iconPath;
  final int level;
  final int studyTime;
  final bool isSelected;

  const BottomItemWidget({
    super.key,
    required this.title,
    required this.progress,
    required this.iconPath,
    required this.level,
    required this.studyTime,
    required this.isSelected,
  });

  @override
  Widget build(
    final BuildContext context,
  ) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 3500),
        curve: Curves.easeInOut,
        width: isSelected ? 90.w : 80.w,
        height: isSelected ? 180.h : 120.h,
        child: isSelected
            ? Column(
                children: [
                  _imageView(isSelected),
                  SizedBox(height: 4.h),
                  Container(
                    width: 33.w,
                    height: 14.h,
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
                          "${S.of(context).level} $level",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF191919),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 48.w,
                    height: 16.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _formatStudyTime(studyTime),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF3F3F3F),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          width: 16,
                          height: 16,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : _imageView(isSelected),
      );

  Widget _imageView(final bool isSelected) => Container(
        width: isSelected ? 80.w : 60.w,
        height: isSelected ? 80.h : 60.h,
        child: SvgPicture.network(
          iconPath,
          width: isSelected ? 52.w : 40.w,
          height: isSelected ? 52.h : 40.h,
        ),
      );

  String _formatStudyTime(int studyTime) {
    final hours = (studyTime ~/ 60).toString().padLeft(2, '0');
    final minutes = (studyTime % 60).toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}
