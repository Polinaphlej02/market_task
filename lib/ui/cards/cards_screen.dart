import 'package:flutter/material.dart';
import 'package:market_task/data/cards_data.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cardsData.length,
        itemBuilder: (context, index) {
      
          Map item = cardsData[index];
          return Card(
            child: Container(
              child: Column(
                children: [
                  Text(item['name']),
                  item['picture'],
                  Text('description'),
                ],
              ),
            )
          );
        }
        ),
    );
  }
}