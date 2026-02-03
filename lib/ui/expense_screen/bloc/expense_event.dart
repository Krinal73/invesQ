import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class PickReceiptImageEvent extends ExpenseEvent {
  final File file;
  PickReceiptImageEvent({required this.file});
}

class ExpenseTitleChanged extends ExpenseEvent {
  final String title;
  ExpenseTitleChanged(this.title);
}

class ExpenseAmountChanged extends ExpenseEvent {
  final String amount;
  ExpenseAmountChanged(this.amount);
}

class ExpenseCateogryChanged extends ExpenseEvent {
  final String category;
  ExpenseCateogryChanged(this.category);
}

class ExpenseNotesChanged extends ExpenseEvent {
  final String notes;
  ExpenseNotesChanged(this.notes);
}

class ExpenseDateChanged extends ExpenseEvent {
  final String date;
  ExpenseDateChanged(this.date);
}

class OCRProcessEvent extends ExpenseEvent {
  final File file;
  OCRProcessEvent(this.file);
}

class SubmitExpenseEvent extends ExpenseEvent {
  final String title;
  final String amount;
  final String date;
  final String category;
  final File? receiptImage;
  final String notes;

  const SubmitExpenseEvent({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.receiptImage,
    required this.notes,
  });

  @override
  List<Object?> get props => [
    title,
    amount,
    date,
    category,
    receiptImage,
    notes,
  ];
}
