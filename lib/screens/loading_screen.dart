import 'package:crypto_tracker_v2/models/components/history_crypto_currency.dart';
import 'package:crypto_tracker_v2/models/components/currency.dart';
import 'package:crypto_tracker_v2/models/components/currency_list.dart';
import 'package:crypto_tracker_v2/models/components/load_currency.dart';
import 'package:crypto_tracker_v2/models/components/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),

      ),
    );
  }

  @override
  void load() async {


    final state = Provider.of<DataProvider>(context,listen: false);
    LoadCurrency loadCurrency = LoadCurrency();

    List<Currency> coins = await loadCurrency.getCurrencyList(100, 1);

    state.listUpdate(coins);

    Navigator.pushReplacementNamed(
        context,'/lists');
  }


}
