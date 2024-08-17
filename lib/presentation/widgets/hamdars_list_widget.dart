import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/app/app_assets.dart';
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
  Widget build(final BuildContext context) =>
      BlocConsumer<HamDarsCubit, HamDarsState>(
        listener: (
          final BuildContext context,
          final HamDarsState state,
        ) {
          debugPrint("Print _HamdarsListWidgetState 10:");
          setState(() {});
        },
        builder: (
          final BuildContext context,
          final HamDarsState state,
        ) {
          debugPrint("Print _HamdarsListWidgetState 20:");
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
              child: Text("No Selection"),
            );
          }
          return ListView.separated(
            // controller: _scrollController,
            reverse: false,
            physics: const BouncingScrollPhysics(),
            cacheExtent: 50,
            separatorBuilder: (
              final BuildContext context,
              final int index,
            ) =>
                SizedBox(
              height: 6.h,
            ),
            // itemCount: 60,
            itemCount: state.items[state.selectedIndex!]
                .hamdarsQUnitLearningContentDtos!.length,
            itemBuilder: (
              final BuildContext context,
              final int index,
            ) {
              final HamdarsQUnitLearningContentDtos item = state
                  .items[state.selectedIndex!]
                  .hamdarsQUnitLearningContentDtos![index];
              /*return Container(
                height: 80,
                color: Colors.red,
              );*/
              return Container(
                height: 64.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        AppAssets.fasl,
                      ),
                    ),
                    Text(item.hamdarsQUnitLearningContentTypeDesc ?? 'aa'),
                    Container(
                      width: 236,
                      height: 64,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 236,
                            height: 64,
                            decoration: ShapeDecoration(
                              color: Color(0x14758BEB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Text(
                            'فصل چهارم',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'IRANYekanXVFaNum',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '۰0:0۰',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF3F3F3F),
                                    fontSize: 10,
                                    fontFamily: 'IRANYekanXVFaNum',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(width: 8),
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
                          Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(-1.57),
                            child: Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 64,
                      height: 64,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEDEDED),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 1),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
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
