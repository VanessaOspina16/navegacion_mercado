import 'package:flutter/material.dart';

class InicioSesionPage extends StatefulWidget {
  const InicioSesionPage({super.key, required this.onLogin});

  final ValueChanged<String> onLogin;

  @override
  State<InicioSesionPage> createState() => _InicioSesionPageState();
}

class _InicioSesionPageState extends State<InicioSesionPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _rememberSession = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.agriculture_rounded,
                    size: 64,
                    color: Color(0xFF4F9955),
                  ),
                  SwitchListTile(
                    key: const Key('rememberSwitch'),
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Recordarme'),
                    subtitle: const Text(
                      'Mantener esta opción en esta pantalla',
                    ),
                    value: _rememberSession,
                    onChanged: (value) {
                      setState(() => _rememberSession = value);
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Mercado Campesino',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1E2A20),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Inicia sesión para descubrir productores locales',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge
                        ?.copyWith(color: const Color(0xFF687267)),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    key: const Key('emailField'),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    key: Key('passwordField'),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    key: const Key('loginButton'),
                    onPressed: () =>
                        widget.onLogin(_emailController.text.trim()),
                    icon: const Icon(Icons.login_rounded),
                    label: const Text('Iniciar sesión'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF4F9955),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
