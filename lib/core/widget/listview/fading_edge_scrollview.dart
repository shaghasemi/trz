import 'package:flutter/material.dart';

/// Flutter widget for displaying fading edge at start/end of scroll views
class FadingEdgeScrollView extends StatefulWidget {
  /// child widget
  final Widget child;

  /// scroll controller of child widget
  ///
  /// Look for more documentation at [ScrollView.scrollController]
  final ScrollController scrollController;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// Look for more documentation at [ScrollView.reverse]
  final bool reverse;

  /// The axis along which child view scrolls
  ///
  /// Look for more documentation at [ScrollView.scrollDirection]
  final Axis scrollDirection;

  /// what part of screen on start half should be covered by fading edge
  /// gradient
  /// [gradientFractionOnStart] must be 0 <= [gradientFractionOnStart] <= 1
  /// 0 means no gradient,
  /// 1 means gradients on start half of widget fully covers it
  final double gradientFractionOnStart;

  /// what part of screen on end half should be covered by fading edge gradient
  /// [gradientFractionOnEnd] must be 0 <= [gradientFractionOnEnd] <= 1
  /// 0 means no gradient,
  /// 1 means gradients on start half of widget fully covers it
  final double gradientFractionOnEnd;

  const FadingEdgeScrollView._internal({
    required this.child,
    required this.scrollController,
    required this.reverse,
    required this.scrollDirection,
    required this.gradientFractionOnStart,
    required this.gradientFractionOnEnd,
    super.key,
  })  : assert(gradientFractionOnStart >= 0 && gradientFractionOnStart <= 1,
            'gradientFractionOnStart >= 0 && gradientFractionOnStart <= 1'),
        assert(gradientFractionOnEnd >= 0 && gradientFractionOnEnd <= 1,
            'gradientFractionOnEnd >= 0 && gradientFractionOnEnd <= 1');

  /// Constructor for creating [FadingEdgeScrollView] with [ScrollView] as child
  /// child must have [ScrollView.controller] set
  factory FadingEdgeScrollView.fromScrollView({
    required final ScrollView child,
    final Key? key,
    final double gradientFractionOnStart = 0.1,
    final double gradientFractionOnEnd = 0.1,
  }) {
    assert(child.controller != null, 'Child must have controller set');

    return FadingEdgeScrollView._internal(
      key: key,
      scrollController: child.controller!,
      scrollDirection: child.scrollDirection,
      reverse: child.reverse,
      gradientFractionOnStart: gradientFractionOnStart,
      gradientFractionOnEnd: gradientFractionOnEnd,
      child: child,
    );
  }

  /// Constructor for creating [FadingEdgeScrollView] with
  /// [SingleChildScrollView] as child
  /// child must have [SingleChildScrollView.controller] set
  factory FadingEdgeScrollView.fromSingleChildScrollView({
    required final SingleChildScrollView child,
    final Key? key,
    final double gradientFractionOnStart = 0.1,
    final double gradientFractionOnEnd = 0.1,
  }) {
    assert(child.controller != null, 'Child must have controller set');

    return FadingEdgeScrollView._internal(
      key: key,
      scrollController: child.controller!,
      scrollDirection: child.scrollDirection,
      reverse: child.reverse,
      gradientFractionOnStart: gradientFractionOnStart,
      gradientFractionOnEnd: gradientFractionOnEnd,
      child: child,
    );
  }

  /// Constructor for creating [FadingEdgeScrollView] with [PageView] as child
  /// child must have [PageView.controller] set
  factory FadingEdgeScrollView.fromPageView({
    required final PageView child,
    final Key? key,
    final double gradientFractionOnStart = 0.1,
    final double gradientFractionOnEnd = 0.1,
  }) {
    assert(child.controller != null, 'Child must have controller set');
    return FadingEdgeScrollView._internal(
      key: key,
      scrollController: child.controller!,
      scrollDirection: child.scrollDirection,
      reverse: child.reverse,
      gradientFractionOnStart: gradientFractionOnStart,
      gradientFractionOnEnd: gradientFractionOnEnd,
      child: child,
    );
  }

  /// Constructor for creating [FadingEdgeScrollView] with [ListView] as child
  /// child must have [ListView.controller] set
  factory FadingEdgeScrollView.fromListView({
    required final ListView child,
    final Key? key,
    final double gradientFractionOnStart = 0.1,
    final double gradientFractionOnEnd = 0.1,
  }) {
    assert(child.controller != null, 'Child must have controller set');

    return FadingEdgeScrollView._internal(
      key: key,
      scrollController: child.controller!,
      scrollDirection: child.scrollDirection,
      reverse: child.reverse,
      gradientFractionOnStart: gradientFractionOnStart,
      gradientFractionOnEnd: gradientFractionOnEnd,
      child: child,
    );
  }

  /// Constructor for creating [FadingEdgeScrollView] with [GridView] as child
  /// child must have [GridView.controller] set
  factory FadingEdgeScrollView.fromGridView({
    required final GridView child,
    final Key? key,
    final double gradientFractionOnStart = 0.1,
    final double gradientFractionOnEnd = 0.1,
  }) {
    assert(child.controller != null, 'Child must have controller set');

    return FadingEdgeScrollView._internal(
      key: key,
      scrollController: child.controller!,
      scrollDirection: child.scrollDirection,
      reverse: child.reverse,
      gradientFractionOnStart: gradientFractionOnStart,
      gradientFractionOnEnd: gradientFractionOnEnd,
      child: child,
    );
  }

  /// Constructor for creating [FadingEdgeScrollView] with
  /// [AnimatedList] as child
  /// child must have [AnimatedList.controller] set
  factory FadingEdgeScrollView.fromAnimatedList({
    required final AnimatedList child,
    final Key? key,
    final double gradientFractionOnStart = 0.1,
    final double gradientFractionOnEnd = 0.1,
  }) {
    assert(child.controller != null, 'Child must have controller set');

    return FadingEdgeScrollView._internal(
      key: key,
      scrollController: child.controller!,
      scrollDirection: child.scrollDirection,
      reverse: child.reverse,
      gradientFractionOnStart: gradientFractionOnStart,
      gradientFractionOnEnd: gradientFractionOnEnd,
      child: child,
    );
  }

  @override
  FadingEdgeScrollViewState createState() => FadingEdgeScrollViewState();
}

class FadingEdgeScrollViewState extends State<FadingEdgeScrollView> {
  ScrollController? _controller;
  bool? _isScrolledToStart;
  bool? _isScrolledToEnd = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.scrollController;
    _isScrolledToStart = _controller!.initialScrollOffset == 0;
    _controller!.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    /*_controller.removeListener(_onScroll);
    _controller.dispose();
    _controller = null;*/
  }

  void _onScroll() {
    final offset = _controller!.offset;
    final minOffset = _controller!.position.minScrollExtent;
    final maxOffset = _controller!.position.maxScrollExtent;

    final isScrolledToEnd = offset >= maxOffset;
    final isScrolledToStart = offset <= minOffset;

    if (isScrolledToEnd != _isScrolledToEnd ||
        isScrolledToStart != _isScrolledToStart) {
      if (mounted) {
        setState(() {
          _isScrolledToEnd = isScrolledToEnd;
          _isScrolledToStart = isScrolledToStart;
        });
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (_controller == null) {
      _controller = widget.scrollController;
      _isScrolledToStart = _controller!.initialScrollOffset == 0;
      _controller!.addListener(_onScroll);
    }

    if (_isScrolledToStart == null && _controller!.hasClients) {
      final offset = _controller!.offset;
      final minOffset = _controller!.position.minScrollExtent;
      final maxOffset = _controller!.position.maxScrollExtent;

      _isScrolledToEnd = offset >= maxOffset;
      _isScrolledToStart = offset <= minOffset;
    }
    return ShaderMask(
      shaderCallback: (final bounds) => LinearGradient(
        begin: _gradientStart,
        end: _gradientEnd,
        stops: [
          0,
          widget.gradientFractionOnStart * 0.5,
          1 - widget.gradientFractionOnEnd * 0.5,
          1,
        ],
        colors: _getColors(
            widget.gradientFractionOnStart > 0 && !(_isScrolledToStart ?? true),
            widget.gradientFractionOnEnd > 0 && !(_isScrolledToEnd ?? false)),
      ).createShader(bounds.shift(Offset(-bounds.left, -bounds.top))),
      blendMode: BlendMode.dstIn,
      child: widget.child,
    );
  }

  Alignment get _gradientStart => widget.scrollDirection == Axis.vertical
      ? _verticalStart
      : _horizontalStart;

  Alignment get _gradientEnd =>
      widget.scrollDirection == Axis.vertical ? _verticalEnd : _horizontalEnd;

  Alignment get _verticalStart =>
      widget.reverse ? Alignment.bottomCenter : Alignment.topCenter;

  Alignment get _verticalEnd =>
      widget.reverse ? Alignment.topCenter : Alignment.bottomCenter;

  Alignment get _horizontalStart =>
      widget.reverse ? Alignment.centerRight : Alignment.centerLeft;

  Alignment get _horizontalEnd =>
      widget.reverse ? Alignment.centerLeft : Alignment.centerRight;

  List<Color> _getColors(
    final bool isStartEnabled,
    final bool isEndEnabled,
  ) =>
      [
        if (isStartEnabled) Colors.transparent else Colors.white,
        Colors.white,
        Colors.white,
        if (isEndEnabled) Colors.transparent else Colors.white
      ];
}
