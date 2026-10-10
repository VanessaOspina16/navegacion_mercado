import 'package:flutter/material.dart';

class CuentaPage extends StatelessWidget {
  const CuentaPage({super.key, required this.email, required this.onLogout});

  final String email;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F6F0),
        title: const Text('Mi cuenta'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFE3F0D9),
              child: Icon(Icons.person_outline_rounded,
                  size: 42, color: Color(0xFF4F9955)),
            ),
            const SizedBox(height: 18),
            Text(
              'Camila Ospina',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1E2A20),
                  ),
            ),
            const SizedBox(height: 6),
            SelectableText(
              email,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF687267),
                  ),
            ),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              key: const Key('logoutButton'),
              onPressed: onLogout,
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
