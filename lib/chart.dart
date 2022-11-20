import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: 300,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <SplineSeries<SalesData, String>>[

            SplineSeries<SalesData, String>(color: Color.fromARGB(255, 47, 125, 121),width: 3,dataSource: <SalesData>[
              SalesData("Sun", 100),
              SalesData("Mon", 80),
              SalesData("Tue", 60),
              SalesData("Wed", 50),
              SalesData("Thu", 90),
            ], xValueMapper: (SalesData sales, _) => sales.year, yValueMapper: (SalesData sales, _) => sales.sales)
          ],
        ),

    );
  }
}

class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}
