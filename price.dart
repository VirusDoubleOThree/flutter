import 'package:flutter/material.dart';

void main() {
  List<List<int>> L = [[6, 6], [6, 12], [6, 18]];

  double nPrice(int e, int f) {
    e = (((e / 6) * f) / 3) * 1800;
    return e;
  }

  int sPrice(int g, int h) {
    g = (((g / 6) * h) / 3) * 1600;
    return g.toInt();
  }

  runApp(MyApp(L: L, nPrice: nPrice, sPrice: sPrice));
}

class MyApp extends StatelessWidget {
  final List<List<int>> L;
  final double Function(int, int) nPrice;
  final int Function(int, int) sPrice;

  MyApp({required this.L, required this.nPrice, required this.sPrice});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Price Calculation'),
        ),
        body: ListView.builder(
          itemCount: L.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${L[index][0]}\'' + ' * ' + '${L[index][1]}\'' + ' Normal Price = ${nPrice(L[index][0], L[index][1])}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${L[index][0]}\'' + ' * ' + '${L[index][1]}\'' + ' Special Price = ${sPrice(L[index][0], L[index][1])}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
