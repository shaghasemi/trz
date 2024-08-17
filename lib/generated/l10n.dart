// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تراکنش‌ها`
  String get transactions {
    return Intl.message(
      'تراکنش‌ها',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `افزودن تراکنش`
  String get add_transaction {
    return Intl.message(
      'افزودن تراکنش',
      name: 'add_transaction',
      desc: '',
      args: [],
    );
  }

  /// `تغییر زبان`
  String get changeLanguage {
    return Intl.message(
      'تغییر زبان',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `تنظیمات`
  String get settings {
    return Intl.message(
      'تنظیمات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `زبان`
  String get language {
    return Intl.message(
      'زبان',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `زبان‌ها`
  String get languages {
    return Intl.message(
      'زبان‌ها',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `تراکنشی مشاهده نشد`
  String get noTransactions {
    return Intl.message(
      'تراکنشی مشاهده نشد',
      name: 'noTransactions',
      desc: '',
      args: [],
    );
  }

  /// `انتخاب تاریخ`
  String get selectDate {
    return Intl.message(
      'انتخاب تاریخ',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `انتخاب دسته`
  String get selectCategory {
    return Intl.message(
      'انتخاب دسته',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `مقدار`
  String get amount {
    return Intl.message(
      'مقدار',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `توضیحات`
  String get description {
    return Intl.message(
      'توضیحات',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `لطفا توضیحات را وارد کنید`
  String get enterDescriptionValidation {
    return Intl.message(
      'لطفا توضیحات را وارد کنید',
      name: 'enterDescriptionValidation',
      desc: '',
      args: [],
    );
  }

  /// `لطفا مقدار را وارد کنید`
  String get enterAmountValidation {
    return Intl.message(
      'لطفا مقدار را وارد کنید',
      name: 'enterAmountValidation',
      desc: '',
      args: [],
    );
  }

  /// `لطفا مقدار صحیحی وارد کنید`
  String get enterValidNumberValidation {
    return Intl.message(
      'لطفا مقدار صحیحی وارد کنید',
      name: 'enterValidNumberValidation',
      desc: '',
      args: [],
    );
  }

  /// `انتخاب زیردسته`
  String get selectSubcategory {
    return Intl.message(
      'انتخاب زیردسته',
      name: 'selectSubcategory',
      desc: '',
      args: [],
    );
  }

  /// `لطفا زیردسته را انتخاب کنید`
  String get selectSubcategoryValidation {
    return Intl.message(
      'لطفا زیردسته را انتخاب کنید',
      name: 'selectSubcategoryValidation',
      desc: '',
      args: [],
    );
  }

  /// `تاریخ`
  String get date {
    return Intl.message(
      'تاریخ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `لطفا تاریخ را انتخاب کنید`
  String get enterDateValidation {
    return Intl.message(
      'لطفا تاریخ را انتخاب کنید',
      name: 'enterDateValidation',
      desc: '',
      args: [],
    );
  }

  /// `برگشت`
  String get back {
    return Intl.message(
      'برگشت',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `انتخاب`
  String get select {
    return Intl.message(
      'انتخاب',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `هزینه`
  String get expenditure {
    return Intl.message(
      'هزینه',
      name: 'expenditure',
      desc: '',
      args: [],
    );
  }

  /// `درآمد`
  String get income {
    return Intl.message(
      'درآمد',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `تومان`
  String get toman {
    return Intl.message(
      'تومان',
      name: 'toman',
      desc: '',
      args: [],
    );
  }

  /// `اضافه کردن 1000 رکورد`
  String get add1000 {
    return Intl.message(
      'اضافه کردن 1000 رکورد',
      name: 'add1000',
      desc: '',
      args: [],
    );
  }

  /// `پاک کردن همه`
  String get deleteAll {
    return Intl.message(
      'پاک کردن همه',
      name: 'deleteAll',
      desc: '',
      args: [],
    );
  }

  /// `بروزرسانی تراکنش`
  String get updateTransaction {
    return Intl.message(
      'بروزرسانی تراکنش',
      name: 'updateTransaction',
      desc: '',
      args: [],
    );
  }

  /// `پاک کردن`
  String get delete {
    return Intl.message(
      'پاک کردن',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `جزئیات`
  String get details {
    return Intl.message(
      'جزئیات',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `جستجو در گوگل`
  String get searchInGoogle {
    return Intl.message(
      'جستجو در گوگل',
      name: 'searchInGoogle',
      desc: '',
      args: [],
    );
  }

  /// `کپی`
  String get copy {
    return Intl.message(
      'کپی',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `مشخصات به کلیپ برد کپی شد`
  String get descriptionCopiedToClipboard {
    return Intl.message(
      'مشخصات به کلیپ برد کپی شد',
      name: 'descriptionCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `پین کردن`
  String get pin {
    return Intl.message(
      'پین کردن',
      name: 'pin',
      desc: '',
      args: [],
    );
  }

  /// `هم‌درس`
  String get hamdars {
    return Intl.message(
      'هم‌درس',
      name: 'hamdars',
      desc: '',
      args: [],
    );
  }

  /// `امکان دریافت اطلاعات وجود ندارد. لطفا دوباره تلاش کنید`
  String get serverDownDesc {
    return Intl.message(
      'امکان دریافت اطلاعات وجود ندارد. لطفا دوباره تلاش کنید',
      name: 'serverDownDesc',
      desc: '',
      args: [],
    );
  }

  /// `سطح`
  String get level {
    return Intl.message(
      'سطح',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `رفرش`
  String get refresh {
    return Intl.message(
      'رفرش',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `No Selection`
  String get noSelection {
    return Intl.message(
      'No Selection',
      name: 'noSelection',
      desc: '',
      args: [],
    );
  }

  /// `در این دسته آیتمی وجود ندارد`
  String get noItemInThisCategory {
    return Intl.message(
      'در این دسته آیتمی وجود ندارد',
      name: 'noItemInThisCategory',
      desc: '',
      args: [],
    );
  }

  /// `آیتمی مشاهده نشد`
  String get noItem {
    return Intl.message(
      'آیتمی مشاهده نشد',
      name: 'noItem',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
