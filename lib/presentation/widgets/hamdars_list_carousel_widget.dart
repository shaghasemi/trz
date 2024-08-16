import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  int selectedIndex = 0;

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (final BuildContext context, final HamDarsState state) {
          if (state.items.isEmpty) {
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
              onTap: () {
                debugPrint("Print onPageChanged 30: $index");
                _scrollController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastEaseInToSlowEaseOut,
                );
                // _scrollController.jumpToPage(index);
              },
              child: BottomItemWidget(
                title: state.items[index].name ?? '',
                progress: state.items[index].progress ?? 0,
                iconPath: state.items[index].unitIcon ?? '',
                level: state.items[index].hamdarsUserUnitLevelIndex ?? 0,
                studyTime: state.items[index].sumUserStudy ?? 0,
                isSelected: index == selectedIndex,
                // isSelected: false,
              ),
            ),
            itemCount: state.items.length,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.4,
              // aspectRatio: 5,
              initialPage: 0,
              // enlargeFactor: 0.4,
              height: 181,
              clipBehavior: Clip.hardEdge,
              padEnds: true,
              onScrolled: (final double? value) {
                debugPrint("Print onPageChanged 20: $value");
              },
              animateToClosest: true,
              disableCenter: false,
              // enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enableInfiniteScroll: false,
              onPageChanged: (
                final int index,
                final CarouselPageChangedReason reason,
              ) {
                setState(() {
                  selectedIndex = index;
                });
                debugPrint("Print onPageChanged 10: $index");
                debugPrint("Print onPageChanged 12: $reason");
              },
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      );
}
