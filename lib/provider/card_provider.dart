import 'package:market_task/models/cards_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<CardsModel> cardsData = [
  CardsModel(id: '1', name: "Phone", image: 'assets/images/phone.jpg', description: 'The best phone with 128GB'),
  CardsModel(id: '2', name: "Laptop", image: 'assets/images/laptop.jpg', description: 'The best leptop phone with the best touchpad'),
  CardsModel(id: '3', name: "Bottle", image: 'assets/images/bottle.jpg', description: 'This bottle is the best!'),
  CardsModel(id: '4', name: "Washing machine", image: 'assets/images/washing_machine.png', description: 'This bottle is the best!'),
];

final cardDataProvider = Provider((ref) {
  return cardsData;
});