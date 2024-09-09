import 'package:flutter/material.dart';
import 'package:movie_app/data/provider/search_provider.dart';
import 'package:movie_app/data/provider/watchlist_provider.dart';
import 'package:movie_app/ui/screens/home/tabs/home_scaffold.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/screens/splash/splash.dart';
import 'package:movie_app/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider(),),
        ChangeNotifierProvider(create: (_) => WatchlistProvider(),),
      ],
      child: MaterialApp(
        title: 'Movies App',
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        routes: {
          Splash.routeName: (_) => const Splash(),
          HomeScaffold.routeName: (_) => const HomeScaffold(),
          MovieDetails.routeName: (_) =>  MovieDetails(),
        },
        initialRoute: Splash.routeName,
      ),
    );
  }
}
