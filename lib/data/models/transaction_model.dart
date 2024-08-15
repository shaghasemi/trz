import 'package:objectbox/objectbox.dart';

@Entity()
class TransactionModel {
  @Id()
  int id;

  final String description;
  final int amount;
  final DateTime date;
  final int categoryId;
  final int subCategoryId;
  final bool isIncome;

  TransactionModel({
    this.id = 0,
    required this.description,
    required this.amount,
    required this.date,
    required this.categoryId,
    required this.subCategoryId,
    required this.isIncome,
  });
}
