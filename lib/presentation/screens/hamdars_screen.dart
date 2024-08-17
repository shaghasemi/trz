import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/core/widget/bottom_sheet.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/presentation/screens/settings_screen.dart';
import 'package:hamdars/presentation/widgets/container/curved_top_container.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_carousel_widget.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_widget.dart';
import 'package:hamdars/presentation/widgets/add_transaction_widget.dart';

class HamDarsScreen extends StatefulWidget {
  const HamDarsScreen({super.key});

  @override
  State<HamDarsScreen> createState() => _HamDarsScreenState();
}

class _HamDarsScreenState extends State<HamDarsScreen> {
  @override
  void initState() {
    debugPrint("Print HamDarsCubitHamDarsScreen 10:");
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    debugPrint("Print HamDarsCubitHamDarsScreen 20:");
    return ContextMenuOverlay(
      /*cardBuilder: (context, children) {
        return Container(
          color: Colors.red,
          padding: const EdgeInsets.all(30),
          child: Column(children: children),
        );
      },*/
      buttonStyle: const ContextMenuButtonStyle(
        fgColor: Color(0xFF737373),
        // bgColor: Colors.green.shade100,
        // hoverFgColor: Colors.green,
        // hoverBgColor: Colors.green.shade200,
      ),
      child: GestureDetector(
        onTap: context.hideKeyboard,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            // title: const Text('Transactions'),
            title: Text(S.of(context).hamdars),
            actions: [
              IconButton(
                onPressed: () => context.navTo(const SettingsScreen()),
                icon: const Icon(Icons.settings),
              ),
              PopupMenuButton<String>(
                onSelected: (final String result) {},
                itemBuilder: (final BuildContext context) =>
                    <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'add_1000',
                    child: Text(S.of(context).add1000),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete_all',
                    child: Text(S.of(context).deleteAll),
                  ),
                ],
              ),
            ],
          ),
          body: const HamdarsListWidget(),
          bottomSheet: CurvedTopContainer(
            minHeight: 40.h,
            maxHeight: 181.h,
            // padding:EdgeInsets.zero,
            color: Colors.white,
            child: BlocProvider(
              create: (final BuildContext context) =>
                  context.read<HamDarsCubit>()..loadMain(),
              child: const HamdarsListCarouselWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
