import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invesq/ui/expense_screen/view/expense_screen.dart';

import '../utils/color_utils.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorUtils.primaryColor,
      onPressed: () {
        Get.toNamed(ExpenseScreen.route);
      },
      child: const Icon(Icons.add),
    );
  }
}
