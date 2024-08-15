import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/widgets/bottom_item_widget.dart';

class HamdarsListBottomWidget extends StatefulWidget {
  const HamdarsListBottomWidget({super.key});

  @override
  State<HamdarsListBottomWidget> createState() =>
      _HamdarsListBottomWidgetState();
}

class _HamdarsListBottomWidgetState extends State<HamdarsListBottomWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          context.read<HamDarsCubit>().loadMain();
        }
      },
    );
  }

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (final BuildContext context, final HamDarsState state) {
          if (state.items.isEmpty) {
            return Center(child: Text(S.of(context).noTransactions));
          }
          return CurvedCarousel(
            itemBuilder: (
              final BuildContext _,
              final int index,
            ) {
              return BottomItemWidget(
                title: state.items[index].name ?? '',
                progress: state.items[index].progress ?? 0,
                iconPath: state.items[index].unitIcon ?? '',
                level: state.items[index].hamdarsUserUnitLevelIndex ?? 0,
                studyTime: state.items[index].sumUserStudy ?? 0,
                isSelected: false,
              );
            },
            itemCount: state.items.length,
            middleItemScaleRatio: 2.5,
            scaleMiddleItem: true,
            curveScale: -10,
            moveAutomatically: true,
            tiltItemWithcurve: false,
            reverseAutomaticMovement: true,
          );
        },
      );
}
