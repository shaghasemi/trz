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
          return RotatedBox(
            quarterTurns: 1,
            child: ListWheelScrollView(
              controller: _scrollController,

              itemExtent: 100,
              children: List.generate(
                state.items.length,
                (int index) => RotatedBox(
                  quarterTurns: -1,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("Print onPageChanged 30: $index");
                      setState(() {
                        selectedIndex = index;
                      });
                      _scrollController.animateTo(
                        300,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: BottomItemWidget(
                      title: state.items[index].name ?? '',
                      progress: state.items[index].progress ?? 0,
                      iconPath: state.items[index].unitIcon ?? '',
                      level: state.items[index].hamdarsUserUnitLevelIndex ?? 0,
                      studyTime: state.items[index].sumUserStudy ?? 0,
                      isSelected: index == selectedIndex,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
