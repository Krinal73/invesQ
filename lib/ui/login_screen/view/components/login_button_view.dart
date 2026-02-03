import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/text_utils.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/enum_utils.dart';
import '../../../../widgets/custom_button_widget.dart';
import '../../bloc/login_bloc.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.isValid != current.isValid ||
          previous.apiStatus !=
              current.apiStatus, // rebuild on apiStatus change
      builder: (context, state) {
        return CustomElevatedButtonWidget(
          onPressed: state.isValid && state.apiStatus != ApiStatus.loading
              ? () => loginBloc.add(const OnClickLoginEvent())
              : null,
          child: state.apiStatus == ApiStatus.loading
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  "Login",
                  style: poppinsBold.copyWith(
                    fontSize: 14.sp,
                    color: ColorUtils.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
        );
      },
    );
  }
}
