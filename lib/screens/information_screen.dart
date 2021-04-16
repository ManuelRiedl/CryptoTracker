import 'package:crypto_tracker_v2/models/components/history_crypto_currency.dart';
import 'package:crypto_tracker_v2/models/components/data_provider.dart';
import 'package:crypto_tracker_v2/models/components/information_data.dart';
import 'package:crypto_tracker_v2/models/components/linechart.dart';
import 'package:crypto_tracker_v2/models/components/load_currency.dart';
import 'package:crypto_tracker_v2/models/components/timeperiod_sideways.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar:buildAppBar(),
    body: Column(
      children: [
        InformationData(),
        TimePeriodList(),
        HistoricalLineChart(),
      ],
    ));
  }




  AppBar buildAppBar() {
     double size = MediaQuery.of(context).size.width-100;

    return AppBar(
      title: Container(
        child: Consumer<DataProvider>(
        builder: (context, dataprovider, child) => Row(
          children: [
            Image.network(
              dataprovider.currency.image,
              width: size/7,
            ),
            SizedBox(width: 5,),
            Text(dataprovider.currency.symbol.toUpperCase()),
            Text(dataprovider.currency.current_price.toString()),
          ],
    ),
      ),
    ),
    actions: <Widget>
    [IconButton(
        color: Colors.grey,
          onPressed: ()
          {

          },
          icon: Icon(Icons.favorite_border))],
    );
  }


}
