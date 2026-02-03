import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/text_form_field_widget.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/string_utils.dart';
import '../../bloc/login_bloc.dart';

class PasswordTextFormFieldView extends StatelessWidget {
  const PasswordTextFormFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isShowPassword != current.isShowPassword,
      builder: (context, state) {
        return TextFormFieldWidget(
          initialValue: state.password.value,
          hintText: AppStrings.password,
          obscureText: !state.isShowPassword,
          isFieldValid: !state.password.isPure && state.password.isNotValid,
          errorText: AppStrings.passwordEmptyErrorMsg,
          suffixIcon: GestureDetector(
            onTap: () => loginBloc.add(const IsShowPasswordEvent()),
            child: Icon(
              state.isShowPassword ? Icons.visibility : Icons.visibility_off,
              color: ColorUtils.primaryColor,
            ),
          ),
          textInputAction: TextInputAction.done,
          onChanged: (password) =>
              loginBloc.add(PasswordEvent(password: password)),
        );
      },
    );
  }
}
