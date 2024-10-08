import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_task/models/user_model.dart';
import 'package:market_task/provider/user_provider.dart';

class RegisterWidget extends ConsumerStatefulWidget {
  const RegisterWidget({super.key});

  @override
  ConsumerState<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends ConsumerState<RegisterWidget> {

  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isRight = false;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                controller: nameController,
                validator: (value){
                  if ( value == null || value.isEmpty) {
                    return "Please, enter your name";
                  }
                  else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              TextFormField(
                controller: loginController,
                validator: (value){
                  if ( value == null || value.isEmpty) {
                    return "Please, enter your email";
                  }
                  else if (!value.contains("@")) {
                    return "Email entered incorrectly";
                  }
                  else if (ref.read(userNotifier.notifier).checkUserLogin(value)) {
                    return "A user with your email has already registered";
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
                  if (_formKey.currentState!.validate()) {
                      ref.read(userNotifier.notifier).addUser(UserModel(email: loginController.text, name: nameController.text, password: passwordController.text));
                      context.go('/auth');  
                  }
                }, 
                child: const Text("Register")),
            ],
          ),
    );
  }
}