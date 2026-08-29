import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../theme/app_theme.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const MovieListTile({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDark,
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            movie.image,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(movie.title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          '${movie.year} · ${movie.genre}',
          style: const TextStyle(color: Colors.white54),
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.neonPink,
          ),
          onPressed: onToggleFavorite,
        ),
      ),
    );
  }
}
