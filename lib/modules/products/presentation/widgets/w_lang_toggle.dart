import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskapp/core/extentions/color_extension.dart';
import 'package:taskapp/core/extentions/context_extension.dart';

class WLangToggle extends StatefulWidget {
  const WLangToggle({super.key});

  @override
  State<WLangToggle> createState() => _WLangToggleState();
}

class _WLangToggleState extends State<WLangToggle> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 40,
        child: ToggleButtons(
          isSelected: isSelected,
          onPressed: (int index) {
            setState(
                  () {
                if (index == 0) {
                  EasyLocalization.of(context)?.setLocale(const Locale('en'));
                } else {
                  EasyLocalization.of(context)?.setLocale(const Locale('ar'));
                }
                isSelected = [index == 0, index == 1];
              },
            );
          },
          fillColor: context.theme.colorScheme.primaryColor,
          borderWidth: 2,
          selectedBorderColor: context.theme.colorScheme.primaryColor,
          selectedColor: context.theme.colorScheme.whiteColor,
          borderRadius: BorderRadius.circular(15),
          children: const [
            Text('En'),
            Text('Ar'),
          ],
        ),
      ),
    );
  }
}
