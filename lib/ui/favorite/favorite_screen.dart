import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/provider/card_provider.dart';
import 'package:market_task/provider/favorite_provider.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    final favoriteCards = ref.watch(favoriteNotifier);
    final cardData = ref.watch(cardDataProvider);

    return Scaffold(
      body: Container(
        child: Column(
          children: favoriteCards.map((card) {
            return Container(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Image.asset(card.image, height: 80,),
                  const SizedBox(width: 20,),
                  Expanded(child: Text(card.name, style: TextStyle(fontSize: 22),)),
                  IconButton(onPressed: () {
                    ref.read(favoriteNotifier.notifier).removeCard(card);
                  }, icon: Icon(Icons.delete, size: 30,), ),
                ],
              ),
            );
          }).toList()
          )
        ),
    );
  }
}