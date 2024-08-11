import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/models/cards_model.dart';
import 'package:market_task/provider/card_provider.dart';

class SearchCardNotifier extends Notifier<List<CardsModel>> {
  @override
  List<CardsModel> build() {
    return cardsData;
  }

  void namedCard(String cardName) {
    state = [];
    if (cardName.isEmpty) {
      state = cardsData;
    } else {
      state = cardsData
          .where((card) =>
              card.name.toLowerCase().startsWith(cardName.toLowerCase()))
          .toList();
    }
  }
}

final searchNotifier =
    NotifierProvider<SearchCardNotifier, List<CardsModel>>(() {
  return SearchCardNotifier();
});
