import 'package:flutter/material.dart';
import 'package:mock_ronas_it/screens/investments.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/card-image.png', height: 540),
            const SizedBox(height: 8),
            const Text('Investments - simple and reliable',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(
                'Earn money simply, buy coins directly from your\ncard and track your portfolio'),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvestmentsScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(const Size(330, 50)),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
