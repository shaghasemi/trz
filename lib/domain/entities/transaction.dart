class Transaction {
  final int id;
  final String description;
  final int amount;
  final DateTime date;
  final int categoryId;
  final int subCategoryId;
  final bool isIncome;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.categoryId,
    required this.subCategoryId,
    required this.isIncome,
  });
}
