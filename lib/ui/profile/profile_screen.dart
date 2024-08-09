import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 150,),
              Text("Name", style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(onPressed: () {}, child: Container(
          height: 55,
          child: const Column(
            children: [
              SizedBox(height: 5,),
              Icon(Icons.exit_to_app),
              Text("Exit")
            ],
          ),
        )),
      );
  }
}