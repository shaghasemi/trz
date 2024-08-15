import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/widgets/bottom_item_widget.dart';

class HamdarsListPageViewWidget extends StatefulWidget {
  const HamdarsListPageViewWidget({super.key});

  @override
  State<HamdarsListPageViewWidget> createState() =>
      _HamdarsListPageViewWidgetState();
}

class _HamdarsListPageViewWidgetState extends State<HamdarsListPageViewWidget> {
  final PageController _pageController = PageController();
  final double _itemWidth = 200.0;
  final double _itemHeight = 150.0;
  final double _centerScale = 1.3;
  final double _centerHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 20, // Number of items
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double page = 0.0;
            try {
              page = _pageController.page!;
            } catch (e) {
              // Handle the error for page null
            }
            double distance = (page - index).abs();
            double scale = 1.0;
            double height = _itemHeight;

            if (distance < 1.0) {
              scale = 1 + (1 - distance) * (_centerScale - 1);
              height = _itemHeight + (1 - distance) * (_centerHeight - _itemHeight);
            }

            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _itemWidth,
                  height: height,
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
