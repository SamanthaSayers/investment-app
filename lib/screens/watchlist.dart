import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_ronas_it/controllers/coin_controller.dart';

class WatchlistScreen extends StatelessWidget {
  final CoinController coinController = Get.find();

  WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watchlist',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (coinController.favouriteCoins.isEmpty) {
          return const Center(
            child: Text('No favourited coins'),
          );
        }

        return ListView.builder(
          itemCount: coinController.favouriteCoins.length,
          itemBuilder: (context, index) {
            final coin = coinController.favouriteCoins[index];
            return ListTile(
              leading: Image.network(coin.image, height: 40),
              title: Text(coin.name),
              subtitle: Text(coin.symbol.toUpperCase()),
              trailing: Text("\$${coin.currentPrice.toStringAsFixed(2)}"),
            );
          },
        );
      }),
    );
  }
}
