import 'package:flutter/material.dart';
import 'package:market_task/ui/auth/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to  the market"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const AuthWidget(),
        ),
      )
    );
  }
}

