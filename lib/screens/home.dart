import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_ronas_it/bloc/coin_bloc.dart';
import 'package:mock_ronas_it/models/coin_event.dart';
import 'package:mock_ronas_it/models/coin_state.dart';
import 'package:mock_ronas_it/screens/watchlist.dart';

import 'package:mock_ronas_it/screens/sparkline_chart.dart';
import 'package:mock_ronas_it/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investment App',
          style: textStyle(20, Colors.black, FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/watchlist',
            );
          },
          child: const Icon(Icons.star_border),
        ),
      ),
      // displays data emited by bloc
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CoinLoadedState) {
            if (state.coins.isEmpty) {
              return const Center(
                  child: Text(
                      "No coins match your description. Please search again."));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        context.read<CoinBloc>().add(SearchCoinsEvent(value));
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search by coin name',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('',
                          style:
                              textStyle(12, Colors.black, FontWeight.normal)),
                      Text('Coin',
                          style:
                              textStyle(12, Colors.black, FontWeight.normal)),
                      Text('Price',
                          style:
                              textStyle(12, Colors.black, FontWeight.normal)),
                      Text('Change (7d)',
                          style:
                              textStyle(12, Colors.black, FontWeight.normal)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.coins.length,
                      itemBuilder: (context, index) {
                        final coin = state.coins[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/coinDetail',
                              arguments: coin,
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      coin.isFavourite.value
                                          ? Icons.star
                                          : Icons.star_border,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CoinBloc>()
                                          .add(ToggleFavouriteCoinEvent(coin));
                                    },
                                  ),
                                  Image.network(coin.image, height: 30),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(coin.name),
                                      Text(coin.symbol.toUpperCase()),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(children: [
                                    Text(
                                      "\$${coin.currentPrice.toStringAsFixed(2)}",
                                      style: textStyle(
                                          14, Colors.black, FontWeight.bold),
                                    ),
                                    Text(
                                      '${coin.priceChangePercentage24H.toStringAsFixed(2)}%',
                                      style: textStyle(
                                        12,
                                        coin.priceChangePercentage24H < 0
                                            ? Colors.red
                                            : Colors.green,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ]),
                                  const Spacer(),
                                  SizedBox(
                                    width: 90,
                                    height: 50,
                                    child: SparklineChart(
                                        data: coin.sparklineIn7D.price),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CoinErrorState) {
            return Center(child: Text(state.error));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
