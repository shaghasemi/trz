import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/domain/entities/hamdars.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';

class HamdarsListWidget extends StatefulWidget {
  const HamdarsListWidget({super.key});

  @override
  State<HamdarsListWidget> createState() => _HamdarsListWidgetState();
}

class _HamdarsListWidgetState extends State<HamdarsListWidget> {
  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HamDarsCubit, HamDarsState>(
        builder: (final BuildContext context, final HamDarsState state) {
          if (state.items.isEmpty) {
            return Center(child: Text(S.of(context).noTransactions));
          }
          return ListView.builder(
            key: GlobalKey(debugLabel: 'listView'),
            // controller: _scrollController,
            reverse: false,
            physics: const BouncingScrollPhysics(),
            // cacheExtent: 50,
            itemCount: state.items.length,
            itemBuilder: (final BuildContext context, final int index) {
              if (index == state.items.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final Hamdars item = state.items[index];
              return ListTile(
                title: Text(item.name ?? "ss"),
              );
            },
          );
        },
      );
}
