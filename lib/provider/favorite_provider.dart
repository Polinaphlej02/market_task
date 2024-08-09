
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/models/cards_model.dart';

class FavoriteNotifier extends Notifier<Set<CardsModel>> {
  
  @override
  Set<CardsModel> build() {
    return {
    };
  }

  void addCard (CardsModel card) {
    if (!state.contains(card)) {
      state = {...state, card};
    }
  }

  void removeCard(CardsModel card) {
    if (state.contains(card)) {
      state = state.where((e) => e.id != card.id).toSet();
    }
  }

}

final favoriteNotifier = NotifierProvider<FavoriteNotifier, Set<CardsModel>>((){
  return FavoriteNotifier();
});