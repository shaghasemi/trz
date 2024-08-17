import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/presentation/screens/settings_screen.dart';
import 'package:hamdars/presentation/widgets/container/curved_top_container.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_carousel_widget.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_widget.dart';

class HamDarsScreen extends StatefulWidget {
  const HamDarsScreen({super.key});

  @override
  State<HamDarsScreen> createState() => _HamDarsScreenState();
}

class _HamDarsScreenState extends State<HamDarsScreen> {
  @override
  void didChangeDependencies() {
    debugPrint("Print HamDarsScreen 60");
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant final HamDarsScreen oldWidget) {
    debugPrint("Print HamDarsScreen 70");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        extendBody: false,
        appBar: AppBar(
          title: Text(S.of(context).hamdars),
          actions: [
            IconButton(
              onPressed: () => context.navTo(
                const SettingsScreen(),
              ),
              icon: const Icon(Icons.settings),
            ),
            PopupMenuButton<String>(
              onSelected: (final String result) {
                context.read<HamDarsCubit>().loadMain();
              },
              itemBuilder: (final BuildContext context) =>
                  <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'refresh',
                  child: Text(S.of(context).refresh),
                ),
              ],
            ),
          ],
        ),
        body: HamdarsListWidget(),
        bottomSheet: CurvedTopContainer(
          minHeight: 40.h,
          maxHeight: 181.h,
          color: Colors.white,
          padding: EdgeInsets.only(top: 8.h),
          child: const HamdarsListCarouselWidget(),
        ),
      );
}
