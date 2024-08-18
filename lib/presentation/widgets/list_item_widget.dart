import 'package:flutter/material.dart';
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
        height: 64,
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  // color: const Color(0x26000000),
                  color: const Color(0xFFEDEDED),
                  width: 5,
                ),
              ),
              child: Container(
                // width: 48.h,
                // height: 48.h,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // shape: CircleBorder(),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 8,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
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
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 7,
                  bottom: 7,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0x14758BEB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isLoading || item == null
                    ? SkeletonLine(
                        style: SkeletonLineStyle(
                          alignment: Alignment.topRight,
                          height: 16,
                          width: 64,
                          borderRadius: BorderRadius.circular(8),
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
                              const SizedBox(height: 16),
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
                                  const SizedBox(width: 6),
                                  Text(
                                    0.toStudyTime(),
                                    // item.hamdarsQUnitLearningContentTypeIcon.toStudyTime(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Color(0xFF404040),
                                      fontSize: 10,
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
                              width: 12,
                              height: 12,
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
