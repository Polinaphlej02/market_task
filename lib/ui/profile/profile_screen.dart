import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_task/provider/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 150,
            ),
            Consumer(
              builder: ((context, ref, child) {
                final userName = ref.watch(userNameProvider);
                return Text(
                  userName,
                  style: const TextStyle(fontSize: 30),
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            context.go('/auth');
          },
          child: const SizedBox(
            height: 55,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Icon(Icons.exit_to_app),
                Text("Exit")
              ],
            ),
          )),
    );
  }
}
