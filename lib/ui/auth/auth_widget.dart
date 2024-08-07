import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
             const SizedBox(height: 20),
             ElevatedButton(onPressed: () => context.go('/profile'), child: const Text("To the second screen")),
          ],
        );
  }
}