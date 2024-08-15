import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/widgets/bottom_item_widget.dart';

class HamdarsListCustomWidget extends StatefulWidget {
  const HamdarsListCustomWidget({super.key});

  @override
  State<HamdarsListCustomWidget> createState() =>
      _HamdarsListCustomWidgetState();
}

class _HamdarsListCustomWidgetState extends State<HamdarsListCustomWidget>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final double _itemWidth = 150.0;
  final double _itemHeight = 100.0;
  final double _centerScale = 1.3;
  final double _centerHeight = 200.0;
  final double _itemSpacing = 16.0;
  late AnimationController _animationController;
  late Tween<double> _scaleTween;
  late Tween<double> _heightTween;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {}); // Trigger a rebuild to update the size of items
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleTween = Tween<double>(begin: 1.0, end: _centerScale);
    _heightTween = Tween<double>(begin: _itemHeight, end: _centerHeight);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 20, // Number of items
      itemBuilder: (context, index) {
        double centerPosition = MediaQuery.of(context).size.width / 2;
        double itemPosition = _itemWidth * index + _itemWidth / 2;
        double offset = (centerPosition - itemPosition) / _itemWidth;
        double scale = 1.0;
        double height = _itemHeight;

        if (offset.abs() < 1.0) {
          scale = 1 + (1 - offset.abs()) * (_centerScale - 1);
          height =
              _itemHeight + (1 - offset.abs()) * (_centerHeight - _itemHeight);
        }

        return AnimatedBuilder(
          animation: _scrollController,
          builder: (context, child) {
            double animationScale = (offset.abs() < 1.0)
                ? _scaleTween.transform(1 - offset.abs())
                : 1.0;
            double animationHeight = (offset.abs() < 1.0)
                ? _heightTween.transform(1 - offset.abs())
                : _itemHeight;

            return GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  _itemWidth * index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: _itemWidth + _itemSpacing,
                margin: EdgeInsets.symmetric(horizontal: _itemSpacing / 2),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _itemWidth,
                  height: animationHeight,
                  transform: Matrix4.identity()..scale(animationScale),
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
