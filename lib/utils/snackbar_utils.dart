import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invesq/utils/text_utils.dart';

import '../widgets/animated_snackbar_widget.dart';
import 'enum_utils.dart';
import 'extension_utils.dart';

class SnackBarUtils {
  static void showSnackBar({
    SnackBarType type = SnackBarType.success,
    String? title,
    String? message,
  }) {
    AnimatedSnackBar? animatedSnackBar;

    animatedSnackBar = AnimatedSnackBar(
      builder: ((snackBarContext) {
        return Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 3.r,
          color: Get.theme.snackBarTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
            side: BorderSide(color: type.promptColor.withOpacity(0.2)),
          ),
          child: Container(
            width: Get.mediaQuery.size.width,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: type.promptColor, width: 6.w),
              ),
            ),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Icon(type.promptIcon, color: type.promptColor, size: 20.r),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          title ?? type.promptTitle,
                          style: poppinsBold.copyWith(
                            color: type.promptColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (animatedSnackBar != null) {
                          animatedSnackBar.closeOverlay();
                        }
                      },
                      child: Icon(
                        Icons.close,
                        color: Get.theme.textTheme.titleSmall?.color,
                        size: 18.r,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 28.w, right: 28.w),
                  child: Text(
                    message ?? '',
                    style: poppinsMedium.copyWith(
                      color: Get.theme.textTheme.titleLarge?.color,
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      duration: const Duration(seconds: 4),
      snackBarPosition: SnackBarPosition.bottom,
    );

    animatedSnackBar.show(Get.context!);
  }
}
