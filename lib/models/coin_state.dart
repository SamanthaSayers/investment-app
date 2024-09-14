import 'coin_model.dart';

//possible states -- emits to cause UI rebuild (setState())

abstract class CoinState {}

class CoinLoadingState extends CoinState {}

List<Coin> get coins => [];

class CoinLoadedState extends CoinState {
  final List<Coin> coins;

  CoinLoadedState({required this.coins});
}

class CoinErrorState extends CoinState {
  final String error;

  CoinErrorState({required this.error});
}
