import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_ronas_it/card.dart';
import 'package:mock_ronas_it/controllers/coin_controller.dart';
import 'package:mock_ronas_it/sparkline_chart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CoinController coinController = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      suffixIcon: const Icon(Icons.mic),
                      suffixIconColor: Colors.black,
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Featured Investments',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  if (coinController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (coinController.errorMessage.value.isNotEmpty) {
                    return Center(
                        child: Text(coinController.errorMessage.value));
                  }

                  return Row(
                    children: coinController.coins.map((coin) {
                      final color =
                          Color((Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.2);
                      return Card(
                        color: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 80, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(coin.image, height: 50),
                              const SizedBox(height: 30),
                              Text(
                                coin.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                coin.symbol.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    const Text(
                      'My portfolio',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 180),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CardScreen()),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  tileColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  title: Text(
                    '\$ 10 234,45',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Text('+\$1 435, 34 ~ 7.89%',
                      style: TextStyle(color: Colors.green)),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Obx(
                    () => coinController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : coinController.errorMessage.value.isNotEmpty
                            ? Center(
                                child: Text(coinController.errorMessage.value))
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: coinController.coins.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                            coinController.coins[index].image,
                                            height: 40),
                                        Column(
                                          children: [
                                            Text(
                                              coinController.coins[index].symbol
                                                  .toUpperCase(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 60,
                                          height: 20,
                                          child: SparklineChart(
                                            data: coinController.coins[index]
                                                .sparklineIn7D.price,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                "\$${coinController.coins[index].currentPrice.toStringAsFixed(2)}"),
                                            const SizedBox(height: 5),
                                            Text(
                                              "${coinController.coins[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                              style: TextStyle(
                                                color: coinController
                                                            .coins[index]
                                                            .priceChangePercentage24H <
                                                        0
                                                    ? Colors.red
                                                    : Colors.green,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
            ),
          ),
          child: navigationBar),
    );
  }

  final NavigationBar navigationBar = NavigationBar(
    backgroundColor: Colors.white,
    elevation: 0,
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home),
        label: '',
      ),
      NavigationDestination(
        icon: Icon(Icons.search),
        label: '',
      ),
      NavigationDestination(
        icon: Icon(Icons.chat_rounded),
        label: '',
      ),
      NavigationDestination(
        icon: Icon(Icons.person),
        label: '',
      ),
    ],
  );
}
