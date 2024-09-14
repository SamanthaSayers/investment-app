import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/coin_event.dart';
import '../models/coin_state.dart';
import '../models/coin_model.dart';
import 'package:http/http.dart' as http;

//Managing business logic: fetching and manipulating data
//previously handled by coin_controller
//middle-man between event (triggered action) and state (rebuild of UI)

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  List<Coin> allCoins = [];

  CoinBloc() : super(CoinLoadingState()) {
    //executed when event is triggered - event driven architecture, events trigger actions;
    //emits in place of setState
    on<FetchCoinsEvent>((event, emit) async {
      emit(CoinLoadingState());
      try {
        //should exist within service level
        final response = await http.get(Uri.parse(
            'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=true'));
        if (response.statusCode == 200) {
          allCoins = coinFromJson(response.body);
          emit(CoinLoadedState(coins: allCoins));
        } else {
          emit(CoinErrorState(error: "Failed to fetch data"));
        }
      } catch (e) {
        emit(CoinErrorState(error: e.toString()));
      }
    });

    on<SearchCoinsEvent>((event, emit) {
      final filteredCoins = allCoins
          .where((coin) =>
              coin.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(CoinLoadedState(coins: filteredCoins));
    });

    on<ToggleFavouriteCoinEvent>((event, emit) {
      event.coin.isFavourite.value = !event.coin.isFavourite.value;
      emit(CoinLoadedState(coins: allCoins));
    });
  }
}
