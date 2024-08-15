import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/core/widget/bottom_sheet.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/transaction_cubit.dart';
import 'package:hamdars/presentation/screens/settings_screen.dart';
import 'package:hamdars/presentation/widgets/transaction_list.dart';
import 'package:hamdars/presentation/widgets/add_transaction_widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(final BuildContext context) => ContextMenuOverlay(
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
            title: Text(S.of(context).transactions),
            actions: [
              IconButton(
                onPressed: () => context.navTo(const SettingsScreen()),
                icon: const Icon(Icons.settings),
              ),
              PopupMenuButton<String>(
                onSelected: (final String result) {
                  switch (result) {
                    case 'add_1000':
                      context.read<TransactionCubit>().addTransactionDummy();
                      break;
                    case 'delete_all':
                      context.read<TransactionCubit>().deleteAll();
                      break;
                    default:
                  }
                },
                itemBuilder: (final BuildContext context) => <PopupMenuEntry<String>>[
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
                context.read<TransactionCubit>()..fetchTransactions(),
            child: const TransactionListWidget(),
          ),
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
