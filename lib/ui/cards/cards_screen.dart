import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/provider/card_provider.dart';

class CardsScreen extends ConsumerWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardData = ref.watch(cardDataProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: cardsData.length,
        itemBuilder: (context, index) {
    
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Text(cardData[index].name, style: TextStyle(fontSize: 30),),
                    Container(
                      height: 250,
                      width: 300,
                      child: Image.asset(cardData[index].image,)
                      ),
                    Padding(
                      child: Text(cardData[index].description, style: TextStyle(fontSize: 20),),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {}, 
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("ADD TO "),
                          Icon(Icons.favorite),
                        ],)),
                    )
                  ],
                ),
              )
            ),
          );
        }
        ),
    );
  }
}