import 'package:flutter/material.dart';

void main() => runApp(const MercadoApp());

class MercadoApp extends StatelessWidget {
  const MercadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Campesino',
      home: const Scaffold(
        body: Center(child: Text('Mercado Campesino')),
      ),
    );
  }
}
