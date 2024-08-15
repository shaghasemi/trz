import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: isSelected
          ? Container(
              width: 90,
              height: 180,
              child: Column(
                children: [
                  _imageView(),
                  SizedBox(height: 4.h),
                  Container(
                    width: 33,
                    height: 14,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFC107),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'سطح 4',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: 'IRANYekanXVFaNum',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'ادبیات',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 12,
                      fontFamily: 'IRANYekanXVFaNum',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 48,
                    height: 16,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '۰۲:۳۰',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF3F3F3F),
                            fontSize: 10,
                            fontFamily: 'IRANYekanXVFaNum',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 16,
                          height: 16,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : _imageView(),
    );
  }

  Widget _imageView() {
    return Container(
      width: 80,
      height: 80,
      child: SvgPicture.network(
        iconPath,
        width: 52,
        height: 52,
      ),
    );
  }
}
