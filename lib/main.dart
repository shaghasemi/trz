import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdars/app/app_size.dart';
import 'package:hamdars/core/utils/http_certificate.dart';
import 'package:hamdars/core/utils/service_locator.dart';
import 'package:hamdars/core/utils/styling/theme/theme.base.dart';
import 'package:hamdars/data/objectbox/transaction_db.dart';
import 'package:hamdars/data/repositories/transaction_repository.dart';
import 'package:hamdars/domain/use_cases/transaction_use_cases.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/hamdars_cubit.dart';
import 'package:hamdars/presentation/cubit/language/language_cubit.dart';
import 'package:hamdars/presentation/cubit/transaction_cubit.dart';
import 'package:hamdars/routes.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // statusBarColor: primaryLightColorCustomer,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  HttpOverrides.global = CustomHttpOverrides();

  final TransactionDB objectBox = await TransactionDB.create();
  final TransactionRepository transactionRepository = TransactionRepository(
    objectBox,
  );
  final TransactionUseCases transactionUseCases = TransactionUseCases(
    transactionRepository,
  );
  runApp(
    MyApp(
      transactionUseCases,
    ),
  );
}

class MyApp extends StatelessWidget {
  final TransactionUseCases transactionUseCases;

  const MyApp(
    this.transactionUseCases, /*this.languageUseCase,*/ {
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          Provider<TransactionUseCases>.value(
            value: transactionUseCases,
          ),
          BlocProvider<TransactionCubit>(
            create: (final BuildContext context) => TransactionCubit(
              transactionUseCases,
            ),
          ),
          BlocProvider<LanguageCubit>(
            create: (final BuildContext context) =>
                LanguageCubit()..initialize(),
          ),
          BlocProvider<HamDarsCubit>(
            create: (final BuildContext context) => HamDarsCubit()/*..loadMain()*/,
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(AppSize.appWidth, AppSize.appHeight),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (
              final BuildContext context,
              final LanguageState state,
            ) =>
                MaterialApp(
              title: 'Hamed Test',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: routes,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(state.language.key),
              theme: themeBase(
                languageCode: state.language.key,
              ),
            ),
          ),
        ),
      );
}
