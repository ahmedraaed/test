// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class Last6Months extends StatelessWidget {
//   final List<_ChartData> data = [
//     _ChartData('CHN', 65),
//     _ChartData('GER', 80),
//     _ChartData('RUS', 70),
//     _ChartData('BRZ', 62),
//     _ChartData('IND', 94),
//     _ChartData('IXD', 71),
//   ];
//   final TooltipBehavior _tooltip = TooltipBehavior(enable: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//         primaryXAxis: CategoryAxis(),
//         primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
//         tooltipBehavior: _tooltip,
//         series: <ChartSeries<_ChartData, String>>[
//           ColumnSeries<_ChartData, String>(
//               dataSource: data,
//               xValueMapper: (_ChartData data, _) => data.x,
//               yValueMapper: (_ChartData data, _) => data.y,
//               name: 'Gold',
//               color:Theme.of(context).primaryColorDark)
//         ]);
//   }
// }
//
// class _ChartData {
//   _ChartData(this.x, this.y);
//
//   final String x;
//   final double y;
// }
