import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      BlocConsumer<HamDarsCubit, HamDarsState>(
        listener: (final BuildContext context, final HamDarsState state) {
          if (state.isLoading) {
            _scrollController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          }
        },
        builder: (final BuildContext context, final HamDarsState state) {
          if (!state.isLoading && state.items.isEmpty) {
            return Center(
              child: Text(S.of(context).noItem),
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
                title: state.isLoading ? '' : state.items[index].name ?? '',
                progress:
                    state.isLoading ? 0 : state.items[index].progress ?? 0,
                iconPath:
                    state.isLoading ? '' : state.items[index].unitIcon ?? '',
                level: state.isLoading
                    ? 0
                    : state.items[index].hamdarsUserUnitLevelIndex ?? 0,
                studyTime:
                    state.isLoading ? 0 : state.items[index].sumUserStudy ?? 0,
                isSelected:
                    index == (state.isLoading ? 0 : state.selectedIndex),
                isLoading: state.isLoading,
              ),
            ),
            itemCount: state.isLoading ? 6 : state.items.length,
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
