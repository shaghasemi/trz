import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:hamdars/app/app_assets.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/core/widget/bottom_sheet.dart';
import 'package:hamdars/core/widget/snack_bar_widget.dart';
import 'package:hamdars/domain/entities/transaction.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/transaction_cubit.dart';
import 'package:hamdars/presentation/screens/google_screen.dart';
import 'package:hamdars/presentation/widgets/transaction_info_widget.dart';

class TransactionListWidget extends StatefulWidget {
  const TransactionListWidget({super.key});

  @override
  State<TransactionListWidget> createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          context.read<TransactionCubit>().fetchTransactions(isLoadMore: true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (BuildContext context, TransactionState state) {
        if (state.transactions.isEmpty) {
          return Center(child: Text(S.of(context).noTransactions));
        }
        return ListView.builder(
          key: GlobalKey(debugLabel: 'listView'),
          controller: _scrollController,
          reverse: false,
          physics: const BouncingScrollPhysics(),
          // cacheExtent: 50,
          itemCount: state.transactions.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == state.transactions.length) {
              return const Center(child: CircularProgressIndicator());
            }
            final Transaction transaction = state.transactions[index];
            return ContextMenuRegion(
              isEnabled: true,
              contextMenu: GenericContextMenu(
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    S.of(context).copy,
                    icon: _menuIconView(AppAssets.copy),
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: transaction.description),
                      );
                      SnackBarWidget().snackBar(
                        context,
                        S.of(context).descriptionCopiedToClipboard,
                      );
                    },
                  ),
                  ContextMenuButtonConfig(
                    S.of(context).pin,
                    icon: _menuIconView(AppAssets.pinned),
                    onPressed: () {},
                  ),
                  ContextMenuButtonConfig(
                    S.of(context).searchInGoogle,
                    icon: _menuIconView(AppAssets.google),
                    onPressed: () => context.navTo(
                      GoogleScreen(
                        content: transaction.description,
                      ),
                    ),
                  ),
                  ContextMenuButtonConfig(
                    S.of(context).delete,
                    icon: _menuIconView(AppAssets.delete),
                    onPressed: () {
                      context
                          .read<TransactionCubit>()
                          .deleteTransaction(transaction.id);
                    },
                  ),
                  ContextMenuButtonConfig(
                    S.of(context).details,
                    icon: _menuIconView(AppAssets.info),
                    onPressed: () {},
                  ),
                ],
              ),
              child: ListTile(
                title: Text(transaction.description),
                subtitle: Text(
                  '${transaction.amount} ${S.of(context).toman}',
                  style: TextStyle(
                    color: transaction.isIncome ? Colors.green : Colors.red,
                  ),
                ),
                // trailing: Text(transaction.date.toLocal().toPersianDateStr()),
                trailing: Text(
                  transaction.date.toLocal().toPersianDate(
                        showTime: true,
                      ),
                ),
                // onLongPress: () {},
                onTap: () async {
                  BottomSheetWidget().show(
                    context,
                    S.of(context).add_transaction,
                    TransactionInfoWidget(
                      transaction: transaction,
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _menuIconView(String svg) {
    return SvgPicture.asset(
      svg,
      colorFilter: const ColorFilter.mode(
        Color(0xFF737373),
        BlendMode.srcIn,
      ),
      width: 18,
      height: 18,
    );
  }
}
