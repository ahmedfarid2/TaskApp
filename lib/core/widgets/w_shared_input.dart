import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskapp/core/extentions/color_extension.dart';
import 'package:taskapp/core/extentions/context_extension.dart';
import 'package:taskapp/core/extentions/text_theme_extension.dart';

class WSharedInput extends StatefulWidget {
  const WSharedInput({
    super.key,
    this.title,
    this.textInputType,
    this.validator,
    required this.controller,
    this.onChanged,
  });
  final TextEditingController controller;
  final String? title;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  State<WSharedInput> createState() => _WSharedInputState();
}

class _WSharedInputState extends State<WSharedInput> {
  final GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      controller: widget.controller,
      decoration: buildInputDecoration(widget.title ?? ""),
      keyboardType: widget.textInputType,
      validator: widget.validator,
      onChanged: onTextFormFiledChange,
    );
  }

  void onTextFormFiledChange(String value) {

    if (!(fieldKey.currentState?.validate() ?? false)) {
      isError = true;
    } else {
      isError = false;
    }

    if (widget.onChanged != null) {
      widget.onChanged?.call(value);
    }

    setState(() {});
  }

  InputDecoration buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label.tr(),
      labelStyle:  context.textTheme.titleSemiBold_16(context).copyWith(
        color: context.theme.colorScheme.blackColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.theme.colorScheme.blackColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.theme.colorScheme.primaryColor),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: context.theme.colorScheme.primaryColor),
      ),
    );
  }
}
