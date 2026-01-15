// homePage.dart
import 'package:calculator_app/components/nature_tile.dart';
import 'package:calculator_app/pages/favorite.dart';
import 'package:calculator_app/pages/homeContent.dart';
import 'package:calculator_app/pages/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<NatureTile> _favorites = [];

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeContent(
        onToggleFavorite: _toggleFavorite,
        isFavorite: _isFavorite,
      ),
      Favorite(favorites: _favorites),
    ];
  }

  void _toggleFavorite(NatureTile nature) {
    setState(() {
      if (_favorites.any((item) => item == nature)) {
        _favorites.removeWhere((item) => item == nature);
      } else {
        _favorites.add(nature);
      }
    });
  }

  bool _isFavorite(NatureTile nature) {
    return _favorites.any((item) => item == nature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back'),
        actions: [
          GestureDetector(
            onTap: () => print('User reload'),
            child: const Icon(Icons.refresh),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.grey),
              child: Image.asset('assets/images/nature.jpeg'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),  // ← fixed typo
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}