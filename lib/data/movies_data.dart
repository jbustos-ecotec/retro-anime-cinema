import 'package:flutter/material.dart';
import '../models/movie.dart';

const List<Movie> movies = [
  Movie(
    'Akira',
    '1988',
    'Cyberpunk',
    'Una historia cyberpunk sobre poderes psíquicos en un Tokio futurista.',
    Icons.motorcycle,
    'assets/images/akira.jpg',
  ),
  Movie(
    'Ghost in the Shell',
    '1995',
    'Cyberpunk',
    'Una cyborg investiga los límites entre humanidad y tecnología.',
    Icons.memory,
    'assets/images/ghost_in_the_shell.jpg',
  ),
  Movie(
    'Nausicaä del Valle del Viento',
    '1984',
    'Fantasía',
    'Una princesa lucha por la paz entre humanos y la naturaleza.',
    Icons.eco,
    'assets/images/nausicaa.jpg',
  ),
  Movie(
    'La Tumba de las Luciérnagas',
    '1988',
    'Drama',
    'Dos hermanos intentan sobrevivir en el Japón de la posguerra.',
    Icons.local_florist,
    'assets/images/luciernagas.jpg',
  ),
  Movie(
    'Dragon Ball Z: La Batalla de los Dioses',
    '1990',
    'Acción',
    'Goku enfrenta a un poderoso dios de la destrucción.',
    Icons.flash_on,
    'assets/images/dbz.jpg',
  ),
];
