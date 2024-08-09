import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_task/data/users_data.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();

  
}

class _AuthWidgetState extends State<AuthWidget> {

  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRight = false;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: loginController,
                validator: (value){
                  if ( value == null || value.isEmpty) {
                    return "Please, enter your email";
                  }
                  else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                validator: (value){
                  if ( value == null || value.isEmpty) {
                    return "Please, enter your password";
                  }
                  else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
               const SizedBox(height: 20),
               ElevatedButton(onPressed: () { 
                  if (_formKey.currentState!.validate() & loginChecking(loginController.text) & passwordCheking(loginController.text, passwordController.text)) {
                      context.go('/profile');  
                  }
                }, 
                child: const Text("To the second screen")),
               TextButton(onPressed: () {}, child: const Text("Sign up")),
            ],
          ),
    );
  }
}