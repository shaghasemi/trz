import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/core/utils/service_locator.dart';
import 'package:hamdars/domain/entities/hamdars.dart';
import 'package:hamdars/domain/use_cases/hamdars_use_cases.dart';

class HamDarsState {
  final List<Hamdars> items;
  final bool isLoading;
  final String? errorMessage;
  int? selectedIndex;

  HamDarsState({
    required this.items,
    required this.isLoading,
    this.errorMessage,
    this.selectedIndex,
  });

  HamDarsState copyWith({
    final List<Hamdars>? transactions,
    final bool? isLoading,
    final String? errorMessage,
    final int? selectedIndex,
  }) =>
      HamDarsState(
        items: transactions ?? items,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        selectedIndex: selectedIndex ?? this.selectedIndex,
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
            selectedIndex: 0,
          ),
        );

  void changeSelection(final int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  Future<void> loadMain() async {
    emit(state.copyWith(isLoading: true, selectedIndex: 0));
    try {
      final List<Hamdars> transactions = await _useCases.loadMain();
      emit(
        state.copyWith(
          transactions: transactions,
          isLoading: false,
          selectedIndex: 0,
        ),
      );
    } catch (e) {
      debugPrint("Print HamDarsCubit 19: $e");
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
