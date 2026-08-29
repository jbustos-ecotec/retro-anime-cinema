// Smoke test: verifica que la app arranca y muestra la navegación principal.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:retro_anime_cinema/main.dart';

void main() {
  testWidgets('La app arranca y muestra la barra de navegación', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RetroAnimeCinemaApp());
    await tester.pumpAndSettle();

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('Cartelera'), findsOneWidget);
    expect(find.text('Géneros'), findsOneWidget);
    expect(find.text('Acerca de'), findsOneWidget);
  });
}
