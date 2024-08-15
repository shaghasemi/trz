import 'package:flutter/material.dart';
import 'package:hamdars/presentation/screens/add_transaction_screen.dart';
import 'package:hamdars/presentation/screens/transaction_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const TransactionScreen(),
  '/add_transaction': (BuildContext context) => const AddTransactionScreen(),
};
