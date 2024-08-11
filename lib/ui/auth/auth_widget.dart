import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_task/provider/user_provider.dart';

class AuthWidget extends ConsumerStatefulWidget {
  const AuthWidget({super.key});

  @override
  ConsumerState<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends ConsumerState<AuthWidget> {

  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

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
                    else if (!ref.read(userNotifier.notifier).checkUserLogin(loginController.text)) {
                      return "This user doesn`t exist";
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
                    if (_formKey.currentState!.validate() & ref.read(userNotifier.notifier).checkUser(loginController.text, passwordController.text)) {
                        ref.read(userNameProvider.notifier).update((state) => ref.read(userNotifier.notifier).userName(loginController.text).toString());
                        context.go('/profile');  
                    }               
                  }, 
                  child: const Text("Sign in", style: TextStyle(fontSize: 18),)),
                  
                 TextButton(onPressed: () {
                    context.go('/register'); 
                 }, child: const Text("Sign up", style: TextStyle(
                    decoration: TextDecoration.underline,
                 ),), ),
              ],
            ),
      );
  }

}
