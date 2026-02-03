import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../utils/color_utils.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonRadius,
    this.buttonBackgroundColor,
    this.buttonForegroundColor,
    this.onPressed,
    this.child,
  });

  final double? buttonWidth;
  final double? buttonHeight;
  final double? buttonRadius;
  final Color? buttonBackgroundColor;
  final Color? buttonForegroundColor;
  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorUtils.greyColor;
          }
          return buttonBackgroundColor ?? ColorUtils.primaryColor;
        }),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth ?? context.width, buttonHeight ?? 36.h),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius ?? 12.r),
          ),
        ),
      ),
      child: child /*Text(
        buttonTitle,
        style: poppinsBold.copyWith(
          fontSize: fontSize ?? 14.sp,
          color: ColorUtils.whiteColor,
        ),
        textAlign: TextAlign.center,
      ),*/,
    );
  }
}
