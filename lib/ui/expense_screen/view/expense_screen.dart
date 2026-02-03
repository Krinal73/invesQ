import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/text_utils.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../bloc/expense_bloc.dart';
import '../bloc/expense_event.dart';
import '../bloc/expense_state.dart';

class ExpenseScreen extends StatelessWidget {
  static const String route = '/expense';
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpenseBloc(),
      child: const ExpenseForm(),
    );
  }
}

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  Future<ImageSource?> showImageSourceSheet(BuildContext context) async {
    return await showModalBottomSheet<ImageSource>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () => Navigator.pop(ctx, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () => Navigator.pop(ctx, ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpenseBloc, ExpenseState>(
      listener: (context, state) {
        if (state.validationErrors.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Expense saved successfully!"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          final bloc = context.read<ExpenseBloc>();

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: const Text("Add Expense")),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// TITLE
                    TextFormFieldWidget(
                      initialValue: state.title,
                      labelText: "Title",
                      hintText: "Enter title",
                      errorText: state.validationErrors['title'],
                      onChanged: (val) => bloc.add(ExpenseTitleChanged(val)),
                      isFieldValid: state.validationErrors.containsKey('title'),
                    ),

                    const SizedBox(height: 16),

                    /// AMOUNT
                    TextFormFieldWidget(
                      initialValue: state.amount,
                      labelText: "Amount",
                      hintText: "Enter amount",
                      textInputType: TextInputType.number,
                      errorText: state.validationErrors['amount'],
                      isFieldValid: state.validationErrors.containsKey(
                        'amount',
                      ),
                      onChanged: (val) => bloc.add(ExpenseAmountChanged(val)),
                    ),

                    const SizedBox(height: 16),

                    /// DATE
                    TextFormFieldWidget(
                      initialValue: state.date,
                      labelText: "Date",
                      hintText: "Select date",
                      isReadOnly: true,
                      errorText: state.validationErrors['date'],
                      isFieldValid: state.validationErrors.containsKey('date'),
                      suffixIcon: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (picked != null) {
                          final formattedDate =
                              "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

                          bloc.add(ExpenseDateChanged(formattedDate));
                          bloc.add(
                            SubmitExpenseEvent(
                              title: state.title,
                              amount: state.amount,
                              date:
                                  "${picked.year}-${picked.month}-${picked.day}",
                              category: state.category,
                              receiptImage: state.receiptImage,
                              notes: state.notes,
                            ),
                          );
                        }
                      },
                      onChanged: (_) {},
                    ),

                    const SizedBox(height: 16),

                    /// CATEGORY (unchanged)
                    DropdownButtonFormField<String>(
                      value: state.category.isNotEmpty ? state.category : null,
                      style: poppinsMedium.copyWith(
                        color: ColorUtils.primaryColor,
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        labelText: "Category",
                        labelStyle: poppinsMedium.copyWith(
                          color: ColorUtils.primaryColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      items: ['Travel', 'Food', 'Office', 'Other']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (val) =>
                          bloc.add(ExpenseCateogryChanged(val ?? 'Other')),
                    ),
                    if (state.validationErrors['category'] != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          state.validationErrors['category']!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(height: 16),

                    InkWell(
                      onTap: () async {
                        final source = await showImageSourceSheet(context);
                        if (source == null) return;
                        // 👇 IMPORTANT: wait for bottom sheet to fully dismiss
                        await Future.delayed(const Duration(milliseconds: 400));
                        final picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                          source: source,
                          imageQuality: 80,
                          maxWidth: 1080,
                          maxHeight: 1080,
                        );
                        if (image != null && context.mounted) {
                          context.read<ExpenseBloc>().add(
                            PickReceiptImageEvent(file: File(image.path)),
                          );
                        }
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: Stack(
                          children: [
                            if (state.receiptImage != null)
                              Image.file(
                                state.receiptImage!,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            if (state.ocrStatus == OCRStatus.loading)
                              const Positioned.fill(
                                child: ColoredBox(
                                  color: Colors.black38,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            if (state.receiptImage == null)
                              const Center(
                                child: Icon(Icons.camera_alt, size: 50),
                              ),
                          ],
                        ),
                      ),
                    ),

                    if (state.validationErrors.containsKey('image'))
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          state.validationErrors['image']!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(height: 16),

                    /// NOTES
                    TextFormFieldWidget(
                      initialValue: state.notes,
                      labelText: "Notes",
                      hintText: "Add notes",
                      maxLines: 3,
                      onChanged: (val) => bloc.add(ExpenseNotesChanged(val)),
                    ),

                    const SizedBox(height: 24),

                    CustomElevatedButtonWidget(
                      onPressed: () {
                        bloc.add(
                          SubmitExpenseEvent(
                            title: state.title,
                            amount: state.amount,
                            date: state.date,
                            category: state.category,
                            receiptImage: state.receiptImage,
                            notes: state.notes,
                          ),
                        );
                      },
                      child: const Text(
                        "Save Expense",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    if (state.ocrStatus == OCRStatus.failure)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          "OCR failed: ${state.ocrError}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
