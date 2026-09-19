import 'package:flutter/material.dart';

import 'pantallas/productores.dart';

void main() => runApp(const MercadoApp());

class MercadoApp extends StatelessWidget {
  const MercadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Campesino',
      home: const ProductoresPage(),
    );
  }
}

