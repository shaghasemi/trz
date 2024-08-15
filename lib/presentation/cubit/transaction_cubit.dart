import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/domain/isolate/transaction_isolate.dart';
import 'package:hamdars/domain/use_cases/transaction_use_cases.dart';
import 'package:hamdars/domain/entities/transaction.dart';

class TransactionState {
  final List<Transaction> transactions;
  final bool isLoading;
  final String? errorMessage;

  TransactionState({
    required this.transactions,
    required this.isLoading,
    this.errorMessage,
  });

  TransactionState copyWith({
    final List<Transaction>? transactions,
    final bool? isLoading,
    final String? errorMessage,
  }) => TransactionState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
}

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionUseCases _useCases;
  final int _page = 0;
  static const int _pageSize = 20;

  TransactionCubit(this._useCases)
      : super(
          TransactionState(
            transactions: [],
            isLoading: false,
          ),
        );

  /*Future<void> fetchTransactions({
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore) {
      _page = 0;
    }
    final transactions = await _useCases.getTransactions(
      page: _page,
      pageSize: _pageSize,
    );
    final currentTransactions =
        isLoadMore ? state.transactions + transactions : transactions;
    _page++;
    emit(TransactionState(transactions: currentTransactions));
  }*/

  Future<void> fetchTransactions({
    final bool isLoadMore = false,
  }) async {
    try {
      if (isLoadMore) {
        emit(state.copyWith(isLoading: true));
      }

      final List<Transaction> transactions = await _useCases.loadMain(
        page: _page,
        pageSize: _pageSize,
      );
      final List<Transaction> processedTransactions =
          await processTransactionsInIsolate(transactions);

      emit(
        state.copyWith(
          transactions: isLoadMore
              ? state.transactions + processedTransactions
              : processedTransactions,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> addTransaction(final Transaction transaction) async {
    await _useCases.addTransaction(transaction);
    fetchTransactions();
  }

  Future<void> updateTransaction(final Transaction transaction) async {
    await _useCases.updateTransaction(transaction);
    fetchTransactions();
  }

  Future<void> deleteTransaction(final int id) async {
    await _useCases.deleteTransaction(id);
    fetchTransactions();
  }

  Future<void> addTransactionDummy({
    final int count = 1000,
    final int? startFrom,
  }) async {
    await _useCases.addTransactions(
      count: count,
      startFrom: startFrom ?? state.transactions.length,
    );
    fetchTransactions();
  }

  Future<void> deleteAll() async {
    await _useCases.deleteAll();
    fetchTransactions();
  }
}
