import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapp/core/assets/assets.gen.dart';
import 'package:taskapp/modules/core/presentation/screens/app_bloc_observer.dart';
import 'package:taskapp/modules/core/presentation/screens/app_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: "assets/lang",
      fallbackLocale: const Locale('en'),
      child: const AppCore(),
    ),
  );
}
