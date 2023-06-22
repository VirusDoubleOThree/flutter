import 'package:flutter/material.dart';

void main() {
  List<List<int>> L = [[6, 6], [6, 12], [6, 18], [9,9], [9,12], [9,15],[9,18],[10,10],[12,12],[12,15],[12,18],[12,21],[12,24],[15,15],[15,18],[15,21],[15,24],[15,30],[18,18],[18,21],[18,24],[18,30],[18,36],[18,45],[21,21],[21,30],[21,36],[21,45],[24,24],[24,30],[24,36],[27,27],[30,30],[36,36],[40,40],[42,42],[50,50],[60,60]];

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
