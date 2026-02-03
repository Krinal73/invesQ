import 'dart:io';

import 'package:equatable/equatable.dart';

enum OCRStatus { initial, loading, success, failure }

class ExpenseState extends Equatable {
  final String title;
  final String amount;
  final String date;
  final String category;
  final File? receiptImage;
  final String notes;
  final OCRStatus ocrStatus;
  final String ocrError;

  final Map<String, String> validationErrors;
  final bool isSubmitSuccessful; // NEW

  const ExpenseState({
    this.title = '',
    this.amount = '',
    this.date = '',
    this.category = '',
    this.receiptImage,
    this.notes = '',
    this.ocrStatus = OCRStatus.initial,
    this.ocrError = '',
    this.validationErrors = const {},
    this.isSubmitSuccessful = false,
  });

  ExpenseState copyWith({
    String? title,
    String? amount,
    String? date,
    String? category,
    File? receiptImage,
    String? notes,
    OCRStatus? ocrStatus,
    String? ocrError,
    Map<String, String>? validationErrors,
    bool? isSubmitSuccessful,
  }) {
    return ExpenseState(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      receiptImage: receiptImage ?? this.receiptImage,
      notes: notes ?? this.notes,
      ocrStatus: ocrStatus ?? this.ocrStatus,
      ocrError: ocrError ?? this.ocrError,
      validationErrors: validationErrors ?? this.validationErrors,
      isSubmitSuccessful: isSubmitSuccessful ?? false,
    );
  }

  @override
  List<Object?> get props => [
    title,
    amount,
    date,
    category,
    receiptImage,
    notes,
    ocrStatus,
    ocrError,
    validationErrors,
    isSubmitSuccessful,
  ];
}
