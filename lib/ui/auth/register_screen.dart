import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text("Sign up"),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          context.go('/auth');
        }, icon: const Icon(Icons.arrow_back_outlined)),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const RegisterWidget(),
        ),
      )
    );
  }
}
