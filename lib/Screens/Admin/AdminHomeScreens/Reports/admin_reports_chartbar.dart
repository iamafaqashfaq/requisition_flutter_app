/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const GroupedBarChart(this.seriesList, {super.key, required this.animate});

  factory GroupedBarChart.withSampleData() {
    return GroupedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('Project A', 5),
      OrdinalSales('Project B', 25),
      OrdinalSales('Project C', 100),
      OrdinalSales('Project D', 75),
    ];

    final tableSalesData = [
      OrdinalSales('Project A', 25),
      OrdinalSales('Project B', 50),
      OrdinalSales('Project C', 10),
      OrdinalSales('Project D', 20),
    ];

    final mobileSalesData = [
      OrdinalSales('Project A', 10),
      OrdinalSales('Project B', 15),
      OrdinalSales('Project C', 50),
      OrdinalSales('Project D', 45),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
