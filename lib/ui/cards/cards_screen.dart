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
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Text(item['name'], style: TextStyle(fontSize: 30),),
                    Container(
                      height: 250,
                      width: 300,
                      child: Image.asset(item['picture'],)
                      ),
                    Padding(
                      child: Text(item['description'], style: TextStyle(fontSize: 20),),
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