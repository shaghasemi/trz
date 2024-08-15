import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:hamdars/core/widget/app_toggle_button.dart';
import 'package:hamdars/data/data/base_data.dart';
import 'package:hamdars/domain/entities/category.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/transaction_cubit.dart';
import 'package:hamdars/domain/entities/transaction.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TransactionInfoWidget extends StatefulWidget {
  final Transaction transaction;

  const TransactionInfoWidget({
    super.key,
    required this.transaction,
  });

  @override
  State<TransactionInfoWidget> createState() => _TransactionInfoWidgetState();
}

class _TransactionInfoWidgetState extends State<TransactionInfoWidget> {
  late Transaction _transaction;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  Jalali _dateTimeSelected = Jalali.now();
  final TextEditingController _dateController = TextEditingController();
  bool _isIncome = false;
  Category? _selectedCategory;
  Subcategory? _selectedSubcategory;
  late List<Category> _categories;

  @override
  void initState() {
    _transaction = widget.transaction;
    _categories = BaseData.categories();
    _descriptionController.text = _transaction.description;
    _amountController.text = _transaction.amount.toString();
    _dateTimeSelected = _transaction.date.toJalali();
    _dateController.text = _transaction.date.toPersianDate();
    _isIncome = _transaction.isIncome;
    if (_categories.any((final e) => e.id == _transaction.categoryId)) {
      _selectedCategory = _categories.firstWhere(
        (final e) => e.id == _transaction.categoryId,
        // orElse: () {},
        // orElse: () => _categories.first,
      );
      if (_selectedCategory!.subcategories
          .any((final e) => e.id == _transaction.subCategoryId)) {
        _selectedSubcategory = _selectedCategory?.subcategories.firstWhere(
          (final e) => e.id == _transaction.subCategoryId,
        );
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: S.of(context).description,
              ),
              maxLines: 1,
              validator: (final String? value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).enterDescriptionValidation;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(labelText: S.of(context).amount),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLines: 1,
              validator: (final String? value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).enterAmountValidation;
                }
                if (double.tryParse(value) == null) {
                  return S.of(context).enterValidNumberValidation;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: S.of(context).date),
              keyboardType: TextInputType.text,
              validator: (final String? value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).enterDateValidation;
                }
                return null;
              },
              readOnly: true,
              enabled: true,
              onTap: openCalendar,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 140,
              height: 40,
              child: AppToggleButton(
                value: _isIncome,
                onChange: (final bool newValue) => setState(
                  () => _isIncome = !_isIncome,
                ),
                iconTrue: Icons.arrow_upward,
                iconFalse: Icons.arrow_downward,
                textTrue: S.of(context).income,
                textFalse: S.of(context).expenditure,
                height: 40,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<Category>(
              value: _selectedCategory,
              hint: Text(S.of(context).selectCategory),
              items: _categories.map(
                (final category) => DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  ),
              ).toList(),
              onChanged: (final value) {
                setState(() {
                  _selectedCategory = value;
                  _selectedSubcategory = null;
                });
              },
              validator: (final value) {
                if (value == null) {
                  return S.of(context).selectCategory;
                }
                return null;
              },
            ),
            if (_selectedCategory != null)
              DropdownButtonFormField<Subcategory>(
                value: _selectedSubcategory,
                hint: Text(S.of(context).selectSubcategory),
                items: _selectedCategory!.subcategories.map((final subcategory) => DropdownMenuItem<Subcategory>(
                    value: subcategory,
                    child: Text(subcategory.name),
                  )).toList(),
                onChanged: (final value) {
                  setState(() {
                    _selectedSubcategory = value;
                  });
                },
                validator: (final value) {
                  if (value == null) {
                    return S.of(context).selectSubcategoryValidation;
                  }
                  return null;
                },
              ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final Transaction newTransaction = Transaction(
                    id: 0,
                    // ID will be set by the database
                    description: _descriptionController.text,
                    amount: int.parse(_amountController.text),
                    date: _dateTimeSelected.toDateTime(),
                    categoryId: _selectedCategory!.id,
                    subCategoryId: _selectedSubcategory!.id,
                    isIncome: _isIncome,
                  );
                  context
                      .read<TransactionCubit>()
                      .updateTransaction(newTransaction);
                  Navigator.pop(context);
                }
              },
              child: Text(S.of(context).updateTransaction),
            ),
          ],
        ),
      ),
    );

  Future<void> openCalendar() async {
    final Jalali? dateTimeTemp = await showPersianDatePicker(
      context: context,
      initialDate: _dateTimeSelected,
      firstDate: Jalali.now().addMonths(-1),
      lastDate: Jalali.now(),
      cancelText: S.of(context).back,
      confirmText: S.of(context).select,
      initialDatePickerMode: PDatePickerMode.day,
      initialEntryMode: PDatePickerEntryMode.calendar,
      textDirection: TextDirection.rtl,
    );
    if (dateTimeTemp != null && dateTimeTemp != _dateTimeSelected) {
      _dateTimeSelected = dateTimeTemp;
      _dateController.text = _dateTimeSelected.toDateTime().toPersianDateStr();
      // cubitMain.loadMain();
    }
  }
}
