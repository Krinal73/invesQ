import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';

import '../utils/color_utils.dart';
import '../utils/text_utils.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.initialValue,
    this.labelText,
    this.isFieldValid = false,
    this.errorText,
    this.helperText,
    this.obscureText = false,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    required this.onChanged,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.inputFormatter,
    this.onTap,
    this.focusNode,
    this.autoFocus = false,
    this.scrollPadding,
    this.contentPadding,
  });

  final String initialValue;
  final String? labelText;
  final bool isFieldValid;
  final String? errorText;

  final String? helperText;
  final String? hintText;
  final bool autoFocus;

  final bool obscureText;

  final double? borderRadius;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;

  final ValueChanged onChanged;

  final bool isEnabled;
  final bool isReadOnly;

  final int maxLines;
  final int minLines;
  final int? maxLength;

  final List<TextInputFormatter>? inputFormatter;
  final Function()? onTap;

  final FocusNode? focusNode;
  final EdgeInsets? scrollPadding;

  final EdgeInsets? contentPadding;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TextFormFieldWidget oldWidget) {
    if (_textEditingController.text != widget.initialValue) {
      _textEditingController.text = widget.initialValue;
      _textEditingController.selection = TextSelection.collapsed(
        offset: widget.initialValue.length,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.labelText != null,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: StyledText(
              text: widget.labelText ?? '',
              style: poppinsMedium.copyWith(
                fontSize: 14.sp,
                color: ColorUtils.primaryColor,
              ),
              tags: {
                'required': StyledTextTag(
                  style: poppinsMedium.copyWith(
                    fontSize: 14.sp,
                    color: ColorUtils.errorColor,
                  ),
                ),
              },
            ),
          ),
        ),
        TextFormField(
          key: widget.key,
          controller: _textEditingController,
          focusNode: widget.focusNode,
          autofocus: widget.autoFocus,
          obscureText: widget.obscureText,
          cursorColor: ColorUtils.primaryColor,
          style: poppinsMedium.copyWith(
            color: widget.isFieldValid
                ? ColorUtils.errorColor
                : ColorUtils.primaryColor,
            fontSize: 14.sp,
          ),
          inputFormatters: widget.inputFormatter,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          enabled: widget.isEnabled,
          readOnly: widget.isReadOnly,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: poppinsMedium.copyWith(
              color: ColorUtils.greyColor,
              fontSize: 14.sp,
            ),
            errorMaxLines: 3,
            errorText: widget.isFieldValid ? widget.errorText : null,
            errorStyle: poppinsMedium.copyWith(
              color: ColorUtils.errorColor,
              fontSize: 10.sp,
            ),
            helperMaxLines: 3,
            helperText: widget.helperText,
            helperStyle: poppinsMedium.copyWith(
              color: ColorUtils.primaryColor,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: widget.contentPadding,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorUtils.greyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorUtils.primaryColor),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          scrollPadding: widget.scrollPadding ?? EdgeInsets.only(bottom: 52.h),
          textAlign: TextAlign.start,
          onTapOutside: (pointer) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
        ),
      ],
    );
  }
}
