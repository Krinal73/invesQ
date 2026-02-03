import 'package:flutter/material.dart';
import 'package:invesq/utils/string_utils.dart';

import 'color_utils.dart';
import 'constants.dart';
import 'enum_utils.dart';

extension EmptyValidationTypeExtension
    on TextFormFieldEmptyAndInvalidValidationType {
  String get emailAddress {
    switch (this) {
      case TextFormFieldEmptyAndInvalidValidationType.empty:
        return AppStrings.emailAddressEmptyErrorMsg;
      case TextFormFieldEmptyAndInvalidValidationType.invalid:
        return AppStrings.emailAddressInvalidErrorMsg;
    }
  }
}

extension SnackBarTypeExtension on SnackBarType {
  String get promptTitle {
    switch (this) {
      case SnackBarType.info:
        return strInfo;
      case SnackBarType.error:
        return strError;
      case SnackBarType.success:
        return strSuccess;
      case SnackBarType.warning:
        return strWarning;
    }
  }

  IconData get promptIcon {
    switch (this) {
      case SnackBarType.info:
        return Icons.info_outline_rounded;
      case SnackBarType.error:
        return Icons.cancel_outlined;
      case SnackBarType.success:
        return Icons.check_circle_outline_rounded;
      case SnackBarType.warning:
        return Icons.error_outline_rounded;
    }
  }

  Color get promptColor {
    switch (this) {
      case SnackBarType.info:
        return ColorUtils.snackBarInfoColor;
      case SnackBarType.error:
        return ColorUtils.snackBarErrorColor;
      case SnackBarType.success:
        return ColorUtils.snackBarSuccessColor;
      case SnackBarType.warning:
        return ColorUtils.snackBarWarningColor;
    }
  }
}

extension BaseScreenTypeX on BaseScreenType {
  String get title {
    switch (this) {
      case BaseScreenType.members:
        return 'Members';
      case BaseScreenType.profile:
        return 'Profile';
    }
  }
}
