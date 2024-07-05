import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_ronas_it/controllers/coin_controller.dart';
import 'package:mock_ronas_it/sparkline_chart.dart';

class InvestmentsScreen extends StatelessWidget {
  InvestmentsScreen({Key? key});

  final CoinController coinController = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bitcoin',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              title: Text('\$ ${coinController.coins[1].currentPrice}',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(
                  '${coinController.coins[1].marketCapChangePercentage24H}',
                  style: TextStyle(
                      color:
                          coinController.coins[1].priceChangePercentage24H < 0
                              ? Colors.red
                              : Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              trailing: coinController.coins[1].priceChangePercentage24H > 0
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_drop_up, color: Colors.green),
                      ],
                    )
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_drop_down, color: Colors.red),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: coinController.coins.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 320,
                    child: SparklineChart(
                      data: coinController.coins[1].sparklineIn7D.price,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
          CupertinoSlidingSegmentedControl(
            children: const {
              0: Text('1D'),
              1: Text('1W'),
              2: Text('3M'),
              3: Text('6M'),
              4: Text('1Y'),
              5: Text('ALL'),
            },
            groupValue: 0,
            onValueChanged: (value) {},
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'About company',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                    'Bitcoin is a decentralized digital currency, without a central bank or single administrator, that can be sent from user to user on the peer-to-peer bitcoin network without the need for intermediaries.',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        fixedSize:
                            MaterialStateProperty.all(const Size(160, 50)),
                      ),
                      child: const Text('Sell'),
                    ),
                    const SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        fixedSize:
                            MaterialStateProperty.all(const Size(160, 50)),
                      ),
                      child: const Text('Buy',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
