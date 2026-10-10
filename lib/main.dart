import 'package:flutter/material.dart';

import 'pantallas/cuenta.dart';
import 'pantallas/inicio_sesion.dart';
import 'pantallas/productores.dart';

void main() => runApp(const MercadoApp());

class MercadoApp extends StatelessWidget {
  const MercadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Campesino',
      home: Builder(
        builder: (context) => InicioSesionPage(
          onLogin: (email) {
            Navigator.of(context).push<void>(
              MaterialPageRoute(
                builder: (_) => ProductoresPage(
                  email: email,
                  onLogoutPressed: () => Navigator.of(context).pop(),
                  onAccountPressed: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (accountContext) => CuentaPage(
                        email: email,
                        onLogout: () => Navigator.of(accountContext).pop(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
