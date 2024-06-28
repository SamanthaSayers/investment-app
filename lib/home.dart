import 'package:flutter/material.dart';
import 'package:mock_ronas_it/card.dart';

class HomeScreen extends StatelessWidget {
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
      //Input field for search bar
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Investor, stocks',
                    hintStyle: const TextStyle(color: Colors.black),
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
            //Title
            const Text(
              'Featured Investments',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            //Cards on listview that scrolls horizontally
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    color: const Color(0xffe6effe),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.apple),
                          SizedBox(height: 30),
                          Text('Apple Inc.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 10),
                          Text('APPL',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: const Color(0xffe2dcfe),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.android),
                          SizedBox(height: 30),
                          Text('Google Inc.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 10),
                          Text('GOOGL',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: const Color(0xfffedfff),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.api),
                          SizedBox(height: 30),
                          Text('Company Inc.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 10),
                          Text('COMP',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
            // Container with investment info
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
              child: Row(
                children: [
                  const Icon(Icons.apple),
                  const SizedBox(width: 20),
                  const Column(
                    children: [
                      Text('Apple'),
                      SizedBox(height: 10),
                      Text('APPL'),
                    ],
                  ),
                  const SizedBox(width: 130),
                  Image.asset('assets/upward-green-graph.png', height: 40),
                  const SizedBox(width: 50),
                  const Column(
                    children: [
                      Text('\$169.78'),
                      SizedBox(height: 5),
                      Text('+ \$ 5.3', style: TextStyle(color: Colors.green))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardScreen()),
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.android),
                  const SizedBox(width: 20),
                  const Column(
                    children: [
                      Text('Google Inc.'),
                      SizedBox(height: 10),
                      Text('GOOGL')
                    ],
                  ),
                  const SizedBox(width: 90),
                  Image.asset('assets/downward-red-graph.png', height: 40),
                  const SizedBox(width: 50),
                  const Column(
                    children: [
                      Text('\$203.26'),
                      SizedBox(height: 5),
                      Text('- \$ 4.9',
                          style: TextStyle(color: Colors.redAccent))
                    ],
                  ),
                ],
              ),
            ),
          ],
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
