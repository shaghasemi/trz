import 'dart:math';

import 'package:hamdars/data/models/transaction_model.dart';

class DummyData {
  static List<TransactionModel> transaction({
    final int count = 1000,
    final int start = 0,
  }) {
    final Random random = Random.secure();
    return List.generate(
      count,
      (final int index) => TransactionModel(
        description: 'تراکنش شماره ${index + start + 1}',
        date: DateTime.now(),
        amount: random.nextInt(100000),
        categoryId: random.nextInt(2),
        subCategoryId: random.nextInt(2),
        isIncome: random.nextBool(),
      ),
    );
  }
}
