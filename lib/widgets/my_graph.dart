import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'bar_data.dart';

class MyGraph extends StatelessWidget {
  final List weeklySum;

  const MyGraph({super.key, required this.weeklySum});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      weeklySum[0],
      weeklySum[1],
      weeklySum[2],
      weeklySum[3],
      weeklySum[4],
      weeklySum[5],
      weeklySum[6],
    );

    myBarData.initializeData();

    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    width: 25,
                    toY: data.y,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    switch (value.toInt()) {
      case 0:
        return Text("Jan");
      case 1:
        return Text("Fev");
      case 2:
        return Text("Mar");
      case 3:
        return Text("Avr");
      case 4:
        return Text("Mai");
      case 5:
        return Text("Jui");
      case 6:
        return Text("Jui");
      default:
        return Text("");
    }
  }
}
