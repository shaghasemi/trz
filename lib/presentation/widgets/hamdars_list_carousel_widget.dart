import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdars/core/widget/loading_widget.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/widgets/bottom_item_widget.dart';

class HamdarsListCarouselWidget extends StatefulWidget {
  const HamdarsListCarouselWidget({super.key});

  @override
  State<HamdarsListCarouselWidget> createState() =>
      _HamdarsListCarouselWidgetState();
}

class _HamdarsListCarouselWidgetState extends State<HamdarsListCarouselWidget> {
  final CarouselSliderController _scrollController = CarouselSliderController();

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (final BuildContext context, final HamDarsState state) {
          if (state.isLoading) {
            return Center(
              child: LoadingWidget().circular(),
            );
          } else if (state.items.isEmpty) {
            return Center(
              child: Text(S.of(context).noTransactions),
            );
          }
          return CarouselSlider.builder(
            carouselController: _scrollController,
            itemBuilder: (
              final BuildContext _,
              final int index,
              final int pageViewIndex,
            ) =>
                GestureDetector(
              onTap: () => _scrollController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastEaseInToSlowEaseOut,
              ),
              child: BottomItemWidget(
                title: state.items[index].name ?? '',
                progress: state.items[index].progress ?? 0,
                iconPath: state.items[index].unitIcon ?? '',
                level: state.items[index].hamdarsUserUnitLevelIndex ?? 0,
                studyTime: state.items[index].sumUserStudy ?? 0,
                isSelected: index == state.selectedIndex,
              ),
            ),
            itemCount: state.items.length,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.4,
              initialPage: 0,
              height: 181.h,
              clipBehavior: Clip.hardEdge,
              padEnds: true,
              animateToClosest: true,
              disableCenter: false,
              enableInfiniteScroll: false,
              onPageChanged: (
                final int index,
                final CarouselPageChangedReason reason,
              ) =>
                  context.read<HamDarsCubit>().changeSelection(index),
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      );
}
