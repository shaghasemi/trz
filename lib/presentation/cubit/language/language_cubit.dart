import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:hamdars/app/app_constants.dart';
import 'package:hamdars/domain/entities/language.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  // List<Language> languages = AppConstants.languages();
  // Language language = AppConstants.languages().first;
  Language language = AppConstants.language();

  // LanguageCubit() : super(LanguageInitial(Language('فارسی', 'fa')));
  LanguageCubit() : super(LanguageInitial(AppConstants.language()));

  void initialize() {
    language = AppConstants.languages().first;
    emit(LanguageChanged(language));
  }

  void change(final Language newLanguage) {
    if (newLanguage == language) return;
    language = newLanguage;
    emit(LanguageChanged(language));
  }

  void changeLocale() {
    language = AppConstants.languages().firstWhere(
      (final Language e) => e.key == Intl.getCurrentLocale(),
      orElse: () => AppConstants.languages()[1],
    );
    emit(LanguageChanged(language));
  }
}
