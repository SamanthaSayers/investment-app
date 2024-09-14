import 'package:flutter/material.dart';
import 'package:mock_ronas_it/models/coin_model.dart';
import 'package:mock_ronas_it/screens/sparkline_chart.dart';
import 'package:mock_ronas_it/utils.dart';

class CoinDetailScreen extends StatelessWidget {
  const CoinDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as Coin;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              coin.image,
              height: 32,
              width: 32,
            ),
            const SizedBox(width: 16),
            Text(coin.name,
                style: textStyle(20, Colors.black, FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: SparklineChart(data: coin.sparklineIn7D.price),
            ),
            const SizedBox(height: 32),
            Text('\$${coin.currentPrice.toStringAsFixed(2)}',
                style: textStyle(20, Colors.black, FontWeight.bold)),
            Text('${coin.priceChangePercentage24H.toStringAsFixed(2)}% (24h)',
                style: textStyle(
                    14,
                    coin.priceChangePercentage24H < 0
                        ? Colors.red
                        : Colors.green,
                    FontWeight.normal)),
            const SizedBox(height: 20),
            Text('Market Cap: \$${coin.marketCap}',
                style: textStyle(12, Colors.black, FontWeight.normal)),
            const SizedBox(height: 8),
            Text('ATH: \$${coin.ath}',
                style: textStyle(12, Colors.black, FontWeight.normal)),
            const SizedBox(height: 8),
            Text('Volume (24H): \$${coin.totalVolume}',
                style: textStyle(12, Colors.black, FontWeight.normal)),
            const SizedBox(height: 8),
            Text('Circulating Supply: \$${coin.circulatingSupply}',
                style: textStyle(12, Colors.black, FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
