part of 'language_cubit.dart';

abstract class LanguageState {
  final Language language;

  LanguageState(this.language);
}

class LanguageInitial extends LanguageState {
  LanguageInitial(super.language);
}

class LanguageChanged extends LanguageState {
  LanguageChanged(super.language);
}
