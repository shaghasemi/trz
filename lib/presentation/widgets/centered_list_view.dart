import 'package:flutter/material.dart';

class CenteredListView extends StatefulWidget {
  @override
  _CenteredListViewState createState() => _CenteredListViewState();
}

class _CenteredListViewState extends State<CenteredListView> {
  final ScrollController _scrollController = ScrollController();
  final double _itemWidth = 150.0;
  final double _itemHeight = 30.0;
  final double _centerScale = 1.3;
  final double _centerHeight = 150.0;
  final double _itemSpacing = 16.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {}); // Trigger a rebuild to update the size of items
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
          height = _itemHeight + (1 - offset.abs()) * (_centerHeight - _itemHeight);
        }

        return GestureDetector(
          onTap: () {
            _scrollController.animateTo(
              _itemWidth * index - MediaQuery.of(context).size.width / 2 + _itemWidth / 2,
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
              height: height,
              transform: Matrix4.identity()..scale(scale),
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
  }
}
