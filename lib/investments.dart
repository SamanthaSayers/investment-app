import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Update to show data from API on coin
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apple',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListTile(
              title: Text('\$ 172,72',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              subtitle: Text('+\$ 3,29 ~ 1.94%',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_up, color: Colors.green),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 1),
                        const FlSpot(1, 1.5),
                        const FlSpot(2, 1.4),
                        const FlSpot(3, 3),
                        const FlSpot(4, 2),
                        const FlSpot(5, 2.5),
                        const FlSpot(6, 2.0),
                        const FlSpot(7, 3.5),
                        const FlSpot(8, 4.0),
                        const FlSpot(9, 3.0),
                        const FlSpot(10, 3.5),
                      ],
                      isCurved: true,
                      color: Colors.purple[100],
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.purple[200]?.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
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
                    'Apple Inc. is an American multinational technology company that specializes in consumer electronics, computer software, and online services. Apple is the world\'s largest technology company by revenue and, since January 2021, the world\'s most valuable company.',
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
