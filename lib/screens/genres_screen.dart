import 'package:flutter/material.dart';
import '../data/movies_data.dart';
import '../models/movie.dart';
import '../theme/app_theme.dart';
import '../widgets/movie_list_tile.dart';
import 'movie_detail_screen.dart';

const Map<String, IconData> _genreIcons = {
  'Cyberpunk': Icons.memory,
  'Fantasía': Icons.eco,
  'Drama': Icons.local_florist,
  'Acción': Icons.flash_on,
  'Thriller': Icons.psychology,
  'Magia': Icons.auto_awesome,
};

class GenresScreen extends StatefulWidget {
  final Set<String> favorites;
  final void Function(String title) onToggleFavorite;

  const GenresScreen({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
  });

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  String? selectedGenre;

  List<String> get _genres => movies.map((m) => m.genre).toSet().toList();

  void _openDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailScreen(
          movie: movie,
          isFavorite: widget.favorites.contains(movie.title),
          onToggleFavorite: () => widget.onToggleFavorite(movie.title),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final genre = selectedGenre;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        leading: genre == null
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => selectedGenre = null),
              ),
        title: Text(genre ?? 'Géneros'),
      ),
      body: genre == null ? _buildGenreGrid() : _buildGenreMovies(genre),
    );
  }

  Widget _buildGenreGrid() {
    final genres = _genres;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final g = genres[index];
          return Card(
            color: AppColors.cardMedium,
            child: InkWell(
              onTap: () => setState(() => selectedGenre = g),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _genreIcons[g] ?? Icons.movie,
                    color: AppColors.neonCyan,
                    size: 36,
                  ),
                  const SizedBox(height: 8),
                  Text(g, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenreMovies(String genre) {
    final filtered = movies.where((m) => m.genre == genre).toList();
    return Column(
      children: [
        const Divider(color: Colors.white24, height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final m = filtered[index];
              return MovieListTile(
                movie: m,
                isFavorite: widget.favorites.contains(m.title),
                onToggleFavorite: () => widget.onToggleFavorite(m.title),
                onTap: () => _openDetail(m),
              );
            },
          ),
        ),
      ],
    );
  }
}
