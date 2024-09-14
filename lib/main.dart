import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_ronas_it/bloc/coin_bloc.dart';
import 'package:mock_ronas_it/models/coin_event.dart';
import 'package:mock_ronas_it/screens/coin_detail_screen.dart';
import 'package:mock_ronas_it/screens/home.dart';
import 'package:mock_ronas_it/screens/watchlist.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CoinBloc()..add(FetchCoinsEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment App',
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
      routes: {
        '/coinDetail': (context) => const CoinDetailScreen(),
        '/watchlist': (context) => const WatchlistScreen()
      },
    );
  }
}
