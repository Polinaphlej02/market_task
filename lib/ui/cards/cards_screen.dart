import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/provider/favorite_provider.dart';
import 'package:market_task/provider/search_card_provider.dart';


class CardsScreen extends ConsumerWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardFavorite = ref.watch(favoriteNotifier);
    final cardSearch = ref.watch(searchNotifier);

    return Scaffold(
      body: Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: TextField(
                onChanged: (value) => ref.read(searchNotifier.notifier).namedCard(value),
                      decoration: const InputDecoration(
                        labelText: "Search",
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
            ),
      Expanded(
        child: ListView.builder(
            itemCount: cardSearch.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: Card(
                    child: Column(
                      children: [
                        Text(
                          cardSearch[index].name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                            height: 250,
                            width: 300,
                            child: Image.asset(
                              cardSearch[index].image,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            cardSearch[index].description,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        if (!cardFavorite.contains(cardSearch[index]))
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(favoriteNotifier.notifier)
                                      .addCard(cardSearch[index]);
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ADD TO "),
                                    Icon(Icons.favorite_border),
                                  ],
                                )),
                          ),
                        if (cardFavorite.contains(cardSearch[index]))
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  ref.read(favoriteNotifier.notifier).removeCard(cardSearch[index]);
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
      ),
          ],
        )
    );
  }
}
