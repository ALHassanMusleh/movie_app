import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/home/tabs/browse_tab/browse_tab.dart';
import 'package:movie_app/ui/screens/home/tabs/home_tab/home_tab.dart';
import 'package:movie_app/ui/screens/home/tabs/search_tab/search_tab.dart';
import 'package:movie_app/ui/screens/home/tabs/watchlist_tab/watchlist_tab.dart';

class HomeScaffold extends StatefulWidget {
  static const String routeName = 'Home';
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchlistTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'BROWSE'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark), label: 'Watchlist'),
        ],
      ),
    );
  }
}
