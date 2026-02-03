import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/scaffold_widget.dart';
import 'components/email_address_text_form_field_view.dart';
import 'components/login_button_view.dart';
import 'components/password_text_form_field_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),

              /// Subtitle / Tagline
              Text(
                "Login to continue to your account",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
              SizedBox(height: 16.h),

              /// Email Field
              const EmailAddressTextFormFieldView(),
              SizedBox(height: 16.h),

              /// Password Field
              const PasswordTextFormFieldView(),

              SizedBox(height: 24.h),

              /// Login Button
              const LoginButtonView(),
            ],
          ),
        ),
      ),
    );
  }
}
