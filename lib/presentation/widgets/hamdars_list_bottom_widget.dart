import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamdars/domain/entities/hamdars.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/generated/l10n.dart';

class HamdarsListBottomWidget extends StatefulWidget {
  const HamdarsListBottomWidget({super.key});

  @override
  State<HamdarsListBottomWidget> createState() => _HamdarsListBottomWidgetState();
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
          return ListView.builder(
            key: GlobalKey(debugLabel: 'listView'),
            controller: _scrollController,
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

  Widget _menuIconView(final String svg) => SvgPicture.asset(
        svg,
        colorFilter: const ColorFilter.mode(
          Color(0xFF737373),
          BlendMode.srcIn,
        ),
        width: 18,
        height: 18,
      );
}
