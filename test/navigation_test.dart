import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navegacion_mercado/main.dart';

void main() {
  testWidgets('pasa el correo y permite recorrer la pila', (tester) async {
    await tester.pumpWidget(const MercadoApp());

    final rememberSwitch = find.byKey(const Key('rememberSwitch'));
    expect(tester.widget<SwitchListTile>(rememberSwitch).value, isFalse);
    await tester.tap(rememberSwitch);
    await tester.pump();
    expect(tester.widget<SwitchListTile>(rememberSwitch).value, isTrue);

    await tester.enterText(
      find.byKey(const Key('emailField')),
      'ana@ejemplo.com',
    );
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Hola, ana@ejemplo.com'), findsOneWidget);
    expect(find.byType(Scrollbar), findsOneWidget);
    await tester.tap(find.byKey(const Key('category-Frutas')));
    await tester.pumpAndSettle();
    expect(find.text('Finca La Esperanza'), findsOneWidget);
    expect(find.text('Huerta Dona Rosa'), findsNothing);
    expect(find.text('1 cerca de ti'), findsOneWidget);

    await tester.tap(find.byKey(const Key('category-Todos')));
    await tester.pumpAndSettle();
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
