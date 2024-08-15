import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamdars/core/utils/utils.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hamdars/data/objectbox/transaction_db.dart';
import 'package:hamdars/data/repositories/transaction_repository.dart';
import 'package:hamdars/domain/use_cases/transaction_use_cases.dart';
import 'package:hamdars/main.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final TransactionDB objectBox = await TransactionDB.create();
  final TransactionRepository transactionRepository = TransactionRepository(
    objectBox,
  );
  final TransactionUseCases transactionUseCases = TransactionUseCases(
    transactionRepository,
  );
  group(
    'end-to-end test',
    () {
      testWidgets(
        'Tap on the floating action button to add a transaction',
        (final WidgetTester tester) async {
          await tester.pumpWidget(MyApp(transactionUseCases));
          await waitUntil();
          final Finder fab = find.byKey(
            const ValueKey('add_one_transaction'),
          );
          await tester.tap(fab);
          await tester.pumpAndSettle();
          await waitUntil();

          final Finder descriptionField =
              find.byKey(const Key('descriptionField'));
          await tester.enterText(descriptionField, 'Test Transaction');
          await waitUntil();

          final Finder amountField = find.byKey(const Key('amountField'));
          await tester.enterText(amountField, '1000');
          await waitUntil();

          final Finder incomeToggle = find.byKey(const Key('incomeToggle'));
          await tester.tap(incomeToggle);
          await tester.pumpAndSettle();
          await waitUntil();

          final Finder categoryField = find.byKey(const Key('categoryField'));
          await tester.tap(categoryField);
          await tester.pumpAndSettle();
          final Finder firstCategory = find.text('خانه');
          await tester.tap(firstCategory);
          await tester.pumpAndSettle();
          await waitUntil();

          final Finder subcategoryField =
              find.byKey(const Key('subcategoryField'));
          await tester.tap(subcategoryField);
          await tester.pumpAndSettle();
          final Finder firstSubCategory = find.text('اجاره');
          await tester.tap(firstSubCategory);
          await tester.pumpAndSettle();
          await waitUntil();

          final Finder addButton = find.byKey(const Key('addButton'));
          await tester.tap(addButton);
          await tester.pumpAndSettle();
          await waitUntil(milliseconds: 2000);

          final Finder listView = find.byType(ListView);
          expect(listView, findsOneWidget);
          await tester.pumpAndSettle();

          final Finder firstItem = find
              .descendant(of: listView, matching: find.byType(ListTile))
              .first;
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: firstItem,
              matching: find.text('Test Transaction'),
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}