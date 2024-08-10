import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/provider/card_provider.dart';
import 'package:market_task/provider/favorite_provider.dart';


class CardsScreen extends ConsumerWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardData = ref.watch(cardDataProvider);
    final cardFavorite = ref.watch(favoriteNotifier);

    return Scaffold(
      body: ListView.builder(
          itemCount: cardsData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: Card(
                  child: Column(
                    children: [
                      Text(
                        cardData[index].name,
                        style: const TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                          height: 250,
                          width: 300,
                          child: Image.asset(
                            cardData[index].image,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          cardData[index].description,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      if (!cardFavorite.contains(cardData[index]))
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(favoriteNotifier.notifier)
                                    .addCard(cardData[index]);
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ADD TO "),
                                  Icon(Icons.favorite_border),
                                ],
                              )),
                        ),
                      if (cardFavorite.contains(cardData[index]))
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () {
                                ref.read(favoriteNotifier.notifier).removeCard(cardData[index]);
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Remove "),
                                  Icon(Icons.favorite),
                                ],
                              )),
                        ),
                    ],
                  )),
            );
          }),
    );
  }
}
