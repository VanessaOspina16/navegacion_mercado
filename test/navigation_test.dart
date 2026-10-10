import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navegacion_mercado/main.dart';

void main() {
  testWidgets('pasa el correo y permite recorrer la pila', (tester) async {
    await tester.pumpWidget(const MercadoApp());

    await tester.enterText(
      find.byKey(const Key('emailField')),
      'ana@ejemplo.com',
    );
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Hola, ana@ejemplo.com'), findsOneWidget);
    expect(find.text('Vereda Pantanillo  |  3.2 km'), findsOneWidget);

    await tester.tap(find.text('Cuenta'));
    await tester.pumpAndSettle();
    expect(find.text('Mi cuenta'), findsOneWidget);
    expect(find.text('ana@ejemplo.com'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('Hola, ana@ejemplo.com'), findsOneWidget);

    await tester.tap(find.text('Cuenta'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('logoutButton')));
    await tester.pumpAndSettle();
    expect(find.text('Hola, ana@ejemplo.com'), findsOneWidget);

    await tester.tap(find.byKey(const Key('homeLogoutButton')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('loginButton')), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('emailField')),
      'ana@ejemplo.com',
    );
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
  });
}
