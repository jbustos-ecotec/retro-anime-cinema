import 'package:flutter/material.dart';
import 'screens/about_screen.dart';
import 'screens/genres_screen.dart';
import 'screens/home_screen.dart';
import 'services/favorites_service.dart';
import 'theme/app_theme.dart';

void main() => runApp(const RetroAnimeCinemaApp());

class RetroAnimeCinemaApp extends StatelessWidget {
  const RetroAnimeCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Anime Cinema',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  Set<String> _favorites = {};

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await FavoritesService.loadFavorites();
    setState(() => _favorites = favorites);
  }

  void _toggleFavorite(String title) {
    setState(() {
      if (_favorites.contains(title)) {
        _favorites.remove(title);
      } else {
        _favorites.add(title);
      }
    });
    FavoritesService.saveFavorites(_favorites);

    final isAdded = _favorites.contains(title);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isAdded ? '$title agregada a favoritos' : '$title quitada de favoritos',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(favorites: _favorites, onToggleFavorite: _toggleFavorite),
      GenresScreen(favorites: _favorites, onToggleFavorite: _toggleFavorite),
      const AboutScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.appBar,
        selectedItemColor: AppColors.neonPink,
        unselectedItemColor: Colors.white54,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Cartelera'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Géneros'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Acerca de'),
        ],
      ),
    );
  }
}
