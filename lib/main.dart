import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/provider/language_provider.dart';
import 'core/services/shared_prefs.dart';
import 'core/services/provider/theme_provider.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  final themeMode = await getThemeMode();
  final lang = await getLanguage();

  LanguageProvider().initLanguage(lang: lang);
  await ThemeProvider().init(themeMode: themeMode);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageProvider>(context).getLanguage()),
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.homeRouteName,
    );
  }
}
