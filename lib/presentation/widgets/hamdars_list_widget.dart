import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/app/app_assets.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/core/widget/loading_widget.dart';
import 'package:hamdars/domain/entities/hamdars.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';

class HamdarsListWidget extends StatefulWidget {
  const HamdarsListWidget({super.key});

  @override
  State<HamdarsListWidget> createState() => _HamdarsListWidgetState();
}

class _HamdarsListWidgetState extends State<HamdarsListWidget> {

  @override
  void didChangeDependencies() {
    debugPrint("Print HamdarsListWidget 60");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HamdarsListWidget oldWidget) {
    debugPrint("Print HamdarsListWidget 70");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (
          final BuildContext context,
          final HamDarsState state,
        ) {
          if (state.isLoading) {
            return Center(
              child: LoadingWidget().circular(),
            );
          } else if (state.items.isEmpty) {
            return Center(
              child: Text(S.of(context).noTransactions),
            );
          } else if (state.selectedIndex == null) {
            return Center(
              child: Text(S.of(context).noSelection),
            );
          }
          return ListView.separated(
            // controller: _scrollController,
            reverse: false,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            // shrinkWrap: true,
            // cacheExtent: 50,
            separatorBuilder: (
              final BuildContext context,
              final int index,
            ) =>
                SizedBox(height: 6.h),
            itemCount: state.items[state.selectedIndex!]
                .hamdarsQUnitLearningContentDtos!.length,
            itemBuilder: (
              final BuildContext context,
              final int index,
            ) {
              final HamdarsQUnitLearningContentDtos item = state
                  .items[state.selectedIndex!]
                  .hamdarsQUnitLearningContentDtos![index];
              return SizedBox(
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
                          // color: const Color(0xFFEDEDED),
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
                            // color: const Color(0x26000000),
                            color: const Color(0xFFEDEDED),
                            width: 4.w,
                          ),
                        ),
                        child: item.hamdarsQUnitLearningContentTypeIcon != null
                            ? SvgPicture.network(
                                item.hamdarsQUnitLearningContentTypeIcon!,
                                placeholderBuilder:
                                    (final BuildContext context) =>
                                        SvgPicture.asset(
                                  AppAssets.fasl,
                                ),
                                colorFilter: ColorFilter.mode(
                                  (item.hamdarsQUnitLearningContentTypeColor ??
                                          "")
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
                        child: Row(
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
                                  item.hamdarsQUnitLearningContentTypeDesc ??
                                      '',
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
                            // const Spacer(),
                            /* const Icon(
                              Icons.chevron_left,
                              color: Color(0xff404040),
                              size: 24,
                            ),*/
                            RotatedBox(
                              /*quarterTurns: Directionality.of(context) ==
                                      TextDirection.rtl
                                  ? 0
                                  : 2,*/
                              quarterTurns: context.isDirectionRTL() ? 0 : 2,
                              child: SvgPicture.asset(
                                AppAssets.back,
                                // color: Color(0xff404040),
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
            },
          );
        },
      );
}
