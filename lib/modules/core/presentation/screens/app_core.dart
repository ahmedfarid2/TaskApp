import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapp/core/services/routes/routes.dart';
import 'package:taskapp/core/services/routes/routes_names.dart';
import 'package:taskapp/core/theme/app_theme.dart';
import 'package:taskapp/modules/products/state_managment/products_cubit.dart';

class AppCore extends StatefulWidget {
  const AppCore({super.key});

  @override
  State<AppCore> createState() => _AppCoreState();
}

class _AppCoreState extends State<AppCore> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: MaterialApp(
        title: 'Task App',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.appInit,
        routes: Routes.getRoutes(),
      ),
    );
  }
}
