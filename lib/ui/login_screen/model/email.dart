import 'package:formz/formz.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/enum_utils.dart';

class EmailAddress
    extends FormzInput<String, TextFormFieldEmptyAndInvalidValidationType> {
  const EmailAddress.pure(super.pure) : super.pure();

  const EmailAddress.dirty({String value = ''}) : super.dirty(value);

  static final _emailAddressRegExp = RegExp(regExpEmailAddress);

  @override
  TextFormFieldEmptyAndInvalidValidationType? validator(String value) {
    if (value.isEmpty) {
      return TextFormFieldEmptyAndInvalidValidationType.empty;
    } else if (!_emailAddressRegExp.hasMatch(value)) {
      return TextFormFieldEmptyAndInvalidValidationType.invalid;
    }
    return null;
  }
}
