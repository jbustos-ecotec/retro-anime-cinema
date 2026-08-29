import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/movies_data.dart';
import '../models/movie.dart';
import '../theme/app_theme.dart';
import '../widgets/movie_list_tile.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final Set<String> favorites;
  final void Function(String title) onToggleFavorite;

  const HomeScreen({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Movie? destacada;

  void _sortearPelicula() {
    setState(() {
      destacada = (movies.toList()..shuffle()).first;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: Text(
          'RETRO ANIME CINEMA',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: AppColors.neonCyan,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cartelera 80s / 90s',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            if (destacada != null)
              Card(
                color: AppColors.cardMedium,
                margin: const EdgeInsets.only(bottom: 16),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        destacada!.image,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black87],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  destacada!.icon,
                                  color: AppColors.neonCyan,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    '${destacada!.title} (${destacada!.year})',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              destacada!.synopsis,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _sortearPelicula,
              child: const Text('🎬 Película sorpresa'),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final m = movies[index];
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
        ),
      ),
    );
  }
}
