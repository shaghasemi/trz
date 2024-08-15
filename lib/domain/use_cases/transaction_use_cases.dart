import 'package:hamdars/data/data/dummy_data.dart';
import 'package:hamdars/data/models/transaction_model.dart';
import 'package:hamdars/data/repositories/transaction_repository.dart';
import 'package:hamdars/domain/entities/transaction.dart';

class TransactionUseCases {
  final TransactionRepository _repository;

  TransactionUseCases(this._repository);

  Future<void> addTransaction(final Transaction transaction) {
    final TransactionModel dbTransaction = TransactionModel(
      id: transaction.id,
      description: transaction.description,
      amount: transaction.amount,
      date: transaction.date,
      categoryId: transaction.categoryId,
      subCategoryId: transaction.subCategoryId,
      isIncome: transaction.isIncome,
    );
    return _repository.addTransaction(dbTransaction);
  }

  Future<List<Transaction>> loadMain({
    final int page = 0,
    final int pageSize = 20,
  }) async => (await _repository.getTransactions())
        .map(
          (final e) => Transaction(
            id: e.id,
            amount: e.amount,
            date: e.date,
            description: e.description,
            categoryId: e.categoryId,
            subCategoryId: e.subCategoryId,
            isIncome: e.isIncome,
          ),
        )
        .toList()
        .reversed
        .toList();

  Future<void> updateTransaction(final Transaction transaction) {
    final TransactionModel dbTransaction = TransactionModel(
      id: transaction.id,
      description: transaction.description,
      amount: transaction.amount,
      date: transaction.date,
      categoryId: transaction.amount,
      subCategoryId: transaction.subCategoryId,
      isIncome: transaction.isIncome,
    );
    return _repository.updateTransaction(dbTransaction);
  }

  Future<void> deleteTransaction(final int id) => _repository.deleteTransaction(id);

  Future<void> deleteAll() => _repository.deleteAll();

  Future<void> addTransactions({
    final int count = 1000,
    final int startFrom = 0,
  }) {
    final List<TransactionModel> dbTransactions = DummyData.transaction(
      count: count,
      start: startFrom,
    );
    return _repository.addTransactions(dbTransactions);
  }
}
