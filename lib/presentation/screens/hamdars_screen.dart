import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/core/widget/bottom_sheet.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/presentation/screens/settings_screen.dart';
import 'package:hamdars/presentation/widgets/centered_list_view.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_bottom_widget.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_carousel_widget.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_custom_widget.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_page_view_widget.dart';
import 'package:hamdars/presentation/widgets/hamdars_list_widget.dart';
import 'package:hamdars/presentation/widgets/add_transaction_widget.dart';

import '../widgets/hamdars_list_bottom_widget_4.dart';

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
          body: BlocProvider(
            create: (final BuildContext context) =>
                context.read<HamDarsCubit>()..loadMain(),
            child: const HamdarsListWidget(),
          ),
          bottomSheet: Container(
            color: Colors.blue.shade400,
            height: 200,
            width: double.maxFinite,
            child: BlocProvider(
              create: (final BuildContext context) =>
                  context.read<HamDarsCubit>()..loadMain(),
              // child: CenteredListView(),
              // child: const HamdarsListCustomWidget(),
              // child: const HamdarsListPageViewWidget(),
              child: const HamdarsListCarouselWidget(),
              // child: const HamdarsListBottomWidget(),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: GestureDetector(
            key: const ValueKey('add_one_transaction'),
            onLongPress: () => context.navToNamed('/add_transaction'),
            child: FloatingActionButton(
              onPressed: () {
                BottomSheetWidget().show(
                  context,
                  S.of(context).add_transaction,
                  const AddTransactionWidget(),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
