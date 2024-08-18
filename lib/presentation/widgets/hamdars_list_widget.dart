import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/widgets/list_item_widget.dart';

class HamdarsListWidget extends StatefulWidget {
  const HamdarsListWidget({super.key});

  @override
  State<HamdarsListWidget> createState() => _HamdarsListWidgetState();
}

class _HamdarsListWidgetState extends State<HamdarsListWidget> {
  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (
          final BuildContext context,
          final HamDarsState state,
        ) {
          if (state.isLoading) {
            return ListView.separated(
              reverse: false,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              separatorBuilder: (
                final BuildContext context,
                final int index,
              ) =>
                  const SizedBox(height: 16),
              itemCount: 5,
              itemBuilder: (
                final BuildContext context,
                final int index,
              ) =>
                  const ListItemWidget(
                item: null,
                isLoading: true,
              ),
            );
          } else if (state.items.isEmpty) {
            return Center(
              child: Text(S.of(context).noTransactions),
            );
          } else if (state.selectedIndex == null) {
            return Center(
              child: Text(S.of(context).noSelection),
            );
          } else if (state.items[state.selectedIndex!]
              .hamdarsQUnitLearningContentDtos!.isEmpty) {
            return Center(
              child: Text(S.of(context).noItemInThisCategory),
            );
          }
          return ListView.separated(
            reverse: false,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            separatorBuilder: (
              final BuildContext context,
              final int index,
            ) =>
                const SizedBox(height: 16),
            itemCount: state.items[state.selectedIndex!]
                .hamdarsQUnitLearningContentDtos!.length,
            itemBuilder: (
              final BuildContext context,
              final int index,
            ) =>
                ListItemWidget(
              item: state.items[state.selectedIndex!]
                  .hamdarsQUnitLearningContentDtos![index],
            ),
          );
        },
      );
}
