import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bloc.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_handler.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_theme.dart';
import 'package:instagram_clone/controller/localizations/localization_bloc.dart';
import 'package:instagram_clone/core/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainBloc.bloc,
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        buildWhen: (previous, current) {
          return previous.locale != current.locale;
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Instagram Clone',
            theme: AppTheme.darkTheme,
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            initialRoute: kIsWeb ? RoutesName.login : RoutesName.initial,
            onGenerateRoute: RoutesHandler.onGenerateRoute,
            navigatorKey: navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
