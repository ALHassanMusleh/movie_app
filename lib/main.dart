import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/home/tabs/home_scaffold.dart';
import 'package:movie_app/ui/screens/splash/splash.dart';
import 'package:movie_app/ui/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        Splash.routeName: (_) => const Splash(),
        HomeScaffold.routeName: (_) => const HomeScaffold(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
