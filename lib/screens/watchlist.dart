import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_ronas_it/bloc/coin_bloc.dart';
import 'package:mock_ronas_it/models/coin_state.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watchlist',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinLoadedState) {
            final favouriteCoins =
                state.coins.where((coin) => coin.isFavourite.value).toList();
            if (favouriteCoins.isEmpty) {
              return const Center(child: Text('No favourited coins'));
            }

            return ListView.builder(
              itemCount: favouriteCoins.length,
              itemBuilder: (context, index) {
                final coin = favouriteCoins[index];
                return ListTile(
                  leading: Image.network(coin.image, height: 40),
                  title: Text(coin.name),
                  subtitle: Text(coin.symbol.toUpperCase()),
                  trailing: Text("\$${coin.currentPrice.toStringAsFixed(2)}"),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
