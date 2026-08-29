import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String year;
  final String genre;
  final String synopsis;
  final IconData icon;
  final String image;

  const Movie(
    this.title,
    this.year,
    this.genre,
    this.synopsis,
    this.icon,
    this.image,
  );
}
