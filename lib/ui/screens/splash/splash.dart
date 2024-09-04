import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/home/tabs/home_scaffold.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushNamed(context, HomeScaffold.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/movies.png',
        ),
      ),
    );
  }
}
