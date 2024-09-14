import 'package:mock_ronas_it/models/coin_model.dart';

//possible events -- trigger action

abstract class CoinEvent {}

class FetchCoinsEvent extends CoinEvent {}

class SearchCoinsEvent extends CoinEvent {
  final String query;

  SearchCoinsEvent(this.query);
}

class ToggleFavouriteCoinEvent extends CoinEvent {
  final Coin coin;

  ToggleFavouriteCoinEvent(this.coin);
}
