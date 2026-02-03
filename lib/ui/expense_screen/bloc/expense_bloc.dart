import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/ocr_parcer.dart';
import '../service/ocr_service.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final OCRService _ocrService = OCRService();

  ExpenseBloc() : super(const ExpenseState()) {
    on<PickReceiptImageEvent>(_onReceiptPicked);
    on<OCRProcessEvent>(_onOCRProcess);
    on<SubmitExpenseEvent>(_onSubmitExpense);
    on<ExpenseDateChanged>(_onDateChanged);
    on<ExpenseTitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    on<ExpenseAmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount));
    });
    on<ExpenseCateogryChanged>((event, emit) {
      emit(state.copyWith(title: event.category));
    });

    on<ExpenseNotesChanged>((event, emit) {
      emit(state.copyWith(amount: event.notes));
    });
  }

  void _onDateChanged(ExpenseDateChanged event, Emitter<ExpenseState> emit) {
    emit(state.copyWith(date: event.date));
  }

  void _onReceiptPicked(
    PickReceiptImageEvent event,
    Emitter<ExpenseState> emit,
  ) {
    emit(
      state.copyWith(
        receiptImage: event.file,
        ocrStatus: OCRStatus.loading,
        ocrError: null,
      ),
    );

    add(OCRProcessEvent(event.file));
  }

  Future<void> _onOCRProcess(
    OCRProcessEvent event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      // Extract text from image
      final rawText = await _ocrService.extractText(event.file);

      // Parse receipt fields
      final parsed = ExpenseOCRParser.parse(rawText);
      //  Update form fields
      emit(
        state.copyWith(
          title: parsed['title'] ?? '',
          amount: parsed['amount'] ?? '',
          date: parsed['date'] ?? '',
          category: parsed['category'] ?? 'Other',
          notes: parsed['notes'] ?? '',
          ocrStatus: OCRStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(ocrStatus: OCRStatus.failure, ocrError: e.toString()),
      );
    }
  }

  void _onSubmitExpense(SubmitExpenseEvent event, Emitter<ExpenseState> emit) {
    // Validation map
    final validationErrors = <String, String>{};

    if (event.title.trim().isEmpty) {
      validationErrors['title'] = 'Title is required';
    }

    if (event.amount.trim().isEmpty) {
      validationErrors['amount'] = 'Amount is required';
    }

    if (event.date.trim().isEmpty) {
      validationErrors['date'] = 'Date is required';
    }

    if (event.category.trim().isEmpty) {
      validationErrors['category'] = 'Category is required';
    }

    if (event.receiptImage == null) {
      validationErrors['image'] = 'Receipt image is required';
    }

    // Update state with validation errors
    if (validationErrors.isNotEmpty) {
      emit(state.copyWith(validationErrors: validationErrors));
      print('Validation failed:');
      validationErrors.forEach((key, value) => print(' - $value'));
      return; // stop further processing
    }

    // If all valid, you can proceed with save logic
    print("Expense submitted:");
    print("Title: ${event.title}");
    print("Amount: ${event.amount}");
    print("Date: ${event.date}");
    print("Category: ${event.category}");
    print("Image: ${event.receiptImage?.path}");
    print("Notes: ${event.notes}");

    // Clear validation errors after successful submit
    emit(state.copyWith(validationErrors: {}));
  }

  @override
  Future<void> close() {
    _ocrService.dispose();
    return super.close();
  }
}
