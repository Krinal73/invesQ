import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/extension_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../widgets/text_form_field_widget.dart';
import '../../bloc/login_bloc.dart';

class EmailAddressTextFormFieldView extends StatelessWidget {
  const EmailAddressTextFormFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationBloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.emailAddress != current.emailAddress,
      builder: (context, state) {
        return TextFormFieldWidget(
          initialValue: state.emailAddress.value,
          hintText: AppStrings.emailAddress,
          isFieldValid:
              !state.emailAddress.isPure && state.emailAddress.isNotValid,
          errorText: state.emailAddress.error?.emailAddress,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (emailAddress) => registrationBloc.add(
            EmailAddressEvent(emailAddress: emailAddress),
          ),
        );
      },
    );
  }
}
