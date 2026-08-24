import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const RetroAnimeCinemaApp());

class RetroAnimeCinemaApp extends StatelessWidget {
  const RetroAnimeCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Anime Cinema',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF120B1F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF2E9A),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class Movie {
  final String title;
  final String year;
  final String synopsis;
  final IconData icon;

  const Movie(this.title, this.year, this.synopsis, this.icon);
}

const List<Movie> movies = [
  Movie(
    'Akira',
    '1988',
    'Una historia cyberpunk sobre poderes psíquicos en un Tokio futurista.',
    Icons.motorcycle,
  ),
  Movie(
    'Ghost in the Shell',
    '1995',
    'Una cyborg investiga los límites entre humanidad y tecnología.',
    Icons.memory,
  ),
  Movie(
    'Nausicaä del Valle del Viento',
    '1984',
    'Una princesa lucha por la paz entre humanos y la naturaleza.',
    Icons.eco,
  ),
  Movie(
    'La Tumba de las Luciérnagas',
    '1988',
    'Dos hermanos intentan sobrevivir en el Japón de la posguerra.',
    Icons.local_florist,
  ),
  Movie(
    'Dragon Ball Z: La Batalla de los Dioses',
    '1990',
    'Goku enfrenta a un poderoso dios de la destrucción.',
    Icons.flash_on,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1235),
        title: Text(
          'RETRO ANIME CINEMA',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: Colors.cyanAccent,
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
                color: const Color(0xFF2A1B4A),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(destacada!.icon, color: Colors.cyanAccent),
                          const SizedBox(width: 8),
                          Text(
                            '${destacada!.title} (${destacada!.year})',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        destacada!.synopsis,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
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
                  return Card(
                    color: const Color(0xFF1F1235),
                    child: ListTile(
                      leading: Icon(m.icon, color: Colors.cyanAccent),
                      title: Text(
                        m.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        m.year,
                        style: const TextStyle(color: Colors.white54),
                      ),
                    ),
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
