import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../theme/app_theme.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const MovieDetailScreen({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(movie.icon, color: AppColors.neonCyan),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${movie.title} (${movie.year})',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: AppColors.neonPink,
                        ),
                        onPressed: onToggleFavorite,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Género: ${movie.genre}',
                    style: const TextStyle(color: Colors.white54),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.synopsis,
                    style: const TextStyle(color: Colors.white70, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
