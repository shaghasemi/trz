import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/widgets/bottom_item_widget.dart';

class HamdarsListBottomWidget4 extends StatefulWidget {
  const HamdarsListBottomWidget4({super.key});

  @override
  State<HamdarsListBottomWidget4> createState() =>
      _HamdarsListBottomWidget4State();
}

class _HamdarsListBottomWidget4State extends State<HamdarsListBottomWidget4> {
  // final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    /*_scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          context.read<HamDarsCubit>().loadMain();
        }
      },
    );*/
  }

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (final BuildContext context, final HamDarsState state) {
          if (state.items.isEmpty) {
            return Center(
              child: Text(S.of(context).noTransactions),
            );
          }
          return PageView.builder(
            controller: _pageController,
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;
                  double opacity = 1.0;
                  if (_pageController.hasClients) {
                    double page = _pageController.page ?? 0;
                    scale = (1 - (page - index).abs() * 0.3).clamp(0.7, 1.0);
                    opacity = (1 - (page - index).abs() * 0.5).clamp(0.5, 1.0);
                  }
                  return Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.network(
                              item.unitIcon ?? '',
                              width: 80,
                            ),
                            Text(item.name ?? '',
                                style: TextStyle(fontSize: 18.0)),
                            SizedBox(height: 8.0),
                            Text(item.sumUserStudy.toString(),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      );
}
