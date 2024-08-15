import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/core/utils/service_locator.dart';
import 'package:hamdars/domain/entities/hamdars.dart';
import 'package:hamdars/domain/use_cases/hamdars_use_cases.dart';

class HamDarsState {
  final List<Hamdars> items;
  final bool isLoading;
  final String? errorMessage;

  HamDarsState({
    required this.items,
    required this.isLoading,
    this.errorMessage,
  });

  HamDarsState copyWith({
    final List<Hamdars>? transactions,
    final bool? isLoading,
    final String? errorMessage,
  }) =>
      HamDarsState(
        items: transactions ?? this.items,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

class HamDarsCubit extends Cubit<HamDarsState> {
  final HamDarsUseCases _useCases = serviceLocator<HamDarsUseCases>();

  // HamDarsCubit(super.initialState);

  HamDarsCubit()
      : super(
          HamDarsState(
            items: [],
            isLoading: false,
          ),
        ) {
    debugPrint("Print HamDarsCubit 00:");
  }

  Future<void> loadMain() async {
    debugPrint("Print HamDarsCubit 10:");
    try {
      debugPrint("Print HamDarsCubit 11:");
      final List<Hamdars> transactions = await _useCases.loadMain();
      debugPrint("Print HamDarsCubit 12: $transactions");
      debugPrint("Print HamDarsCubit 13: ${transactions.length}");

      emit(
        state.copyWith(
          transactions: transactions,
          isLoading: false,
        ),
      );
      debugPrint("Print HamDarsCubit 18:");
    } catch (e) {
      debugPrint("Print HamDarsCubit 19: $e");
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

/*Future<void> loadMain({
    final bool isLoadMore = false,
  }) async {
    try {
      if (isLoadMore) {
        emit(state.copyWith(isLoading: true));
      }

      final List<Hamdars> transactions = await _useCases.loadMain(
        page: _page,
        pageSize: _pageSize,
      );
      final List<Hamdars> processedTransactions =
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
  }*/
}
