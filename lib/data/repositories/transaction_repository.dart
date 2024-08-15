import 'package:hamdars/data/objectbox/transaction_db.dart';
import 'package:hamdars/data/models/transaction_model.dart';

class TransactionRepository {
  final TransactionDB _objectBox;

  TransactionRepository(this._objectBox);

  Future<void> addTransaction(
    TransactionModel transaction,
  ) async {
    await _objectBox.transactionBox.putAsync(transaction);
  }

  Future<void> addTransactions(
    List<TransactionModel> transactions,
  ) async {
    await _objectBox.transactionBox.putManyAsync(transactions);
  }

  Future<List<TransactionModel>> getTransactions({
    int page = 0,
    int pageSize = 20,
  }) async {
    return _objectBox.transactionBox
        .query()
        //TODO
        // .offset(page * pageSize)
        // .limit(pageSize)
        .build()
        .find();
  }

  Future<void> updateTransaction(
    TransactionModel transaction,
  ) async {
    await _objectBox.transactionBox.putAsync(transaction);
  }

  Future<void> deleteTransaction(
    int id,
  ) async {
    await _objectBox.transactionBox.removeAsync(id);
  }

  Future<void> deleteAll() async {
    await _objectBox.transactionBox.removeAllAsync();
  }
}
