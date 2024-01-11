import 'package:flutter/material.dart';
import 'package:taskapp/core/extentions/color_extension.dart';
import 'package:taskapp/core/extentions/context_extension.dart';
import 'package:taskapp/core/extentions/text_theme_extension.dart';
import 'package:taskapp/core/widgets/w_button_loader_light.dart';

class WAppButton extends StatefulWidget {
  const WAppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isDisabled = false,
  });

  final String title;
  final bool isDisabled;
  final Function() onTap;

  @override
  State<WAppButton> createState() => _WAppButtonState();
}

class _WAppButtonState extends State<WAppButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (!isLoading && !widget.isDisabled) ? onTap : null,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: disabledColor(context),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: isLoading
              ? const WButtonLoaderLight()
              : SizedBox(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleSemiBold_18(context).copyWith(
                      color: context.theme.colorScheme.whiteColor,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Color? disabledColor(BuildContext context) {
    return widget.isDisabled
        ? context.theme.colorScheme.primaryColor.withOpacity(0.6)
        : context.theme.colorScheme.primaryColor;
  }

  Future<void> onTap() async {
    if (!widget.isDisabled) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      await widget.onTap();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
