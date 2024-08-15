import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:hamdars/core/utils/styling/theme/theme.base.dart';
import 'package:hamdars/data/objectbox/transaction_db.dart';
import 'package:hamdars/data/repositories/transaction_repository.dart';
import 'package:hamdars/domain/use_cases/transaction_use_cases.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/language/language_cubit.dart';
import 'package:hamdars/presentation/cubit/transaction_cubit.dart';
import 'package:hamdars/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<TransactionUseCases>.value(
          value: transactionUseCases,
        ),
        BlocProvider<TransactionCubit>(
          create: (BuildContext context) => TransactionCubit(
            transactionUseCases,
          ),
        ),
        BlocProvider<LanguageCubit>(
          create: (BuildContext context) => LanguageCubit()..initialize(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Hamed TaxiApps Test',
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
          );
        },
      ),
    );
  }
}
