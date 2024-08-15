import 'package:hamdars/data/models/transaction_model.dart';
import 'package:hamdars/data/objectbox/generated/objectbox.g.dart';

class TransactionDB {
  late final Store _store;
  late final Box<TransactionModel> _transactionBox;

  TransactionDB._create(this._store) {
    _transactionBox = Box<TransactionModel>(_store);
  }

  static Future<TransactionDB> create() async {
    final Store store = await openStore();
    return TransactionDB._create(store);
  }

  Box<TransactionModel> get transactionBox => _transactionBox;
}
