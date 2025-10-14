import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../theme/app_theme.dart';
import '../../utils/config/app_config.dart';
import '../helpers/observers/navigation_observer.dart';
import '../helpers/routes/app_router.dart';

class App extends StatefulWidget {
  const App({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      debugPrint('Aplicación en segundo plano');
    } else if (state == AppLifecycleState.resumed) {
      debugPrint('Aplicación reanudada');
    }
  }

  @override
  Widget build(BuildContext context) {
    const Locale locale = Locale('es', 'CO');
    final AppConfig appConfig = AppConfig.of(context);

    return MaterialApp(
      routes: AppRouter.getAllRoutes(),
      initialRoute: widget.initialRoute,
      navigatorObservers: <NavigatorObserver>[NavigationObserver(context)],
      title: appConfig.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: themeNotifier.getThemeMode(),
      locale: locale,
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[locale],
      debugShowCheckedModeBanner: false,
    );
  }
}
