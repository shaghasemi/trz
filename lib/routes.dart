import 'package:flutter/material.dart';
import 'package:hamdars/presentation/screens/add_transaction_screen.dart';
import 'package:hamdars/presentation/screens/hamdars_screen.dart';
import 'package:hamdars/presentation/screens/transaction_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (final BuildContext context) => const HamDarsScreen(),
  '/add_transaction': (final BuildContext context) =>
      const AddTransactionScreen(),
  '/transaction': (final BuildContext context) => const TransactionScreen(),
};
