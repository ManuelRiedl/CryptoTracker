import 'dart:math';

import 'package:crypto_tracker_v2/models/components/data_provider.dart';
import 'package:crypto_tracker_v2/models/components/line_titels.dart';
import 'package:crypto_tracker_v2/models/components/load_currency.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoricalLineChart extends StatefulWidget {
  @override
  _HistoricalLineChartState createState() => _HistoricalLineChartState();
}


class _HistoricalLineChartState extends State<HistoricalLineChart> {

  List history;

  List minmax = [];

  double min;
  double max;
  final List<Color> _gradientColors = [
    const Color(0xFF6FFF7C),
    const Color(0xFF0087FF),
    const Color(0xFF5620FF),
  ];

  double size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size
        .width - 100;
    return Container(
      margin: EdgeInsets.all(10),
        width:450,
        color: Colors.red,
        child: Consumer<DataProvider>(
            builder: (context, dataprovider, child) =>
                Container(
                  child:FutureBuilder(
                    future: dataprovider.updateHistoryDate(),
                    builder: (context,snapshot){
                      Widget ret;
                      if(snapshot.connectionState ==ConnectionState.done)
                        {
                          ret=LineChart(
                            LineChartData(
                              minX: 0,
                              maxX:  dataprovider.maxX,
                              minY: dataprovider.minY,
                              maxY: dataprovider.maxY,
                              titlesData: LineTitles.getTitleData(),
                              gridData: FlGridData(
                                show: true,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: const Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                                drawVerticalLine: true,
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: const Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(color: const Color(0xff37434d), width: 1),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    for ( var i in dataprovider.currentHistory ) i,
                                  ],
                                  colors: _gradientColors,
                                  colorStops: const [0.25, 0.5, 0.75],
                                  gradientFrom: const Offset(0.5, 0),
                                  gradientTo: const Offset(0.5, 1),
                                  barWidth: 2,
                                  isCurved: true,
                                  isStrokeCapRound: true,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                                    gradientColorStops: const [0.25, 0.5, 0.75],
                                    gradientFrom: const Offset(0.5, 0),
                                    gradientTo: const Offset(0.5, 1),
                                  ),

                                ),
                              ],

                            ),
                          );
                        }else
                          {
                            ret=CircularProgressIndicator();
                          }
                      return ret;
                    },
                  )

                 )));
  }


  /*
   LineChart(
                    LineChartData(
                      maxY: minmaxStore[0+dataprovider.pickedGraph],
                      minY: minmaxStore[1+dataprovider.pickedGraph],
                      maxX: dataprovider.days > 2 ? dataprovider.days: 24,
                      minX: 1,
                      lineBarsData:[
                        LineChartBarData(
                          spots: [
                           // for(var elm in history[dataprovider.pickedGraph]) FlSpot(elm.price, elm.time)
                            FlSpot(1,1.1),
                            FlSpot(1.1,1.2)
                          ]
                        )
                      ]

                    )
                ),
   */


  /*
  @override
  void initState()  {
     didChangeDependencies();
  }

  @override
  void didChangeDependencies() async{
    final state = Provider.of<DataProvider>(context, listen: false);



    LoadCurrency loadCurrency = LoadCurrency();

    history = await loadCurrency.getHistory(
        state.days, state.currency.id.toLowerCase().toString());

    state.prices = history[0];
    state.market_cap = history[1];
    state.total_valum = history[2];


    state.setDays(1);
    // state.maxX = state.days == ? 12: state.days ==2 ?48:state.days==3 ?56: state.days==4?60: state.days==5?45:state.days==6 ?121:state.days==7?50:50;


  }

*/

}
