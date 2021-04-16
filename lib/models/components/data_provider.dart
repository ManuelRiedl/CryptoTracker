 import 'package:crypto_tracker_v2/models/components/currency.dart';
import 'package:crypto_tracker_v2/models/components/history_crypto_currency.dart';
import 'package:crypto_tracker_v2/models/components/load_currency.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {

  //Liste der geladenne Coins am listScreen
  List _loadedCoinList = [];
  //Ausgewählte sektion am list_screen
  int _selectedSection = 1;
  //Akteller Coin der am list_screeen ausgewählt wurde
  Currency currency;
  //ausgewählter coin
  int i;
  //ausgewählte anzeigedauer beim inforamtionsscreen im LineChart
  int days=1;
  //Ausgewählter graph Price,MC,TV
  int pickedGraph=0;
  //ausgewählte Zeitspanne
  int timeduration=1;


  //min and max Value for The line Chart
  double minY;
  double maxY;
  double maxX=12;


  //Lists to store historical data
  List prices;
  List market_cap;
  List total_valum;
  //List with the current shown historical data
  List currentHistory=[];
  List store=[];



  List get getLoadedCoins => _loadedCoinList;



  int get getSelectedSection => _selectedSection;

  Currency getLoadedCoinsCurreny(int i){
    return _loadedCoinList[i];
  }




  void setDays2(int i) {
    timeduration=i;
    switch (i) {
      case 1:
        maxX = 12;
        days = 1;
        break;
      case 2:
        maxX = 94;
        days = 1;
        break;
      case 3:
        maxX = 56;
        days = 7;
        break;
      case 4:
        maxX = 60;
        days = 30;
        break;
      case 5:
        maxX = 45;
        days = 90;
        break;
      case 6:
        maxX = 121;
        days = 365;
        break;
      case 7:
        maxX = 100;
        days = 6000;
        break;
    }

    notifyListeners();
  }


  void setDays(int i)
  {
    List minmax=[];
    store.clear();


    switch(i) {
      case 1:
        maxX = 12;
        days =1;
        store.addAll(prices.sublist(prices.length - 13, prices.length));

        break;
      case 2:
        maxX = 94;
        days =1;
        store = everyNth(prices,3);
        break;
      case 3:
        maxX = 56;
        days =7;
        store = everyNth(prices, 5);
        break;
      case 4:
        maxX = 60;
        days =30;
        store = everyNth(prices, 12);
        break;
      case 5:
        maxX = 45;
        days =90;
        store = everyNth(prices, 10);
        break;
      case 6:
        maxX = 121;
        days =365;
        store = everyNth(prices, 3);
        break;
      case 7:
        maxX = 100;
        days =6000;
        int k = prices.length;
        int m = (k / 100).round();
        store = everyNth(prices, m);
        break;


    }


    // state.maxX = state.days == ? 12: state.days ==2 ?48:state.days==3 ?56: state.days==4?60: state.days==5?45:state.days==6 ?121:state.days==7?50:50;


    currentHistory.clear();
    double o=0;
    for(var i in store)
      {

        DateTime dt = DateTime.parse(i.timeString);

        int time =dt.millisecondsSinceEpoch;


        double price= i.price;


        String p = price.toStringAsFixed(3);

        currentHistory.add(FlSpot(o, double.parse(p)));

        o++;
      }

    for(var i in currentHistory)
    {
      minmax.add(i.y);
    }
    maxY=minmax.reduce((curr, next) => curr > next ? curr : next);
    minY=minmax.reduce((curr, next) => curr < next ? curr : next);



    notifyListeners();
  }

  void sectionSelect(int i) {
    _selectedSection = i;
    notifyListeners();
  }

  void currencySelect(int i)
  {
    this.i=i;
    currency=_loadedCoinList[i];
  }

  void listUpdate(List list)
  {
    _loadedCoinList = list;
    notifyListeners();
  }

  List everyNth(List list, int n) {
    list.insert(0, 100);
    final length = list.length-1;
    list.removeAt(0);

    List l=List.generate((length / n).floor(), (i) => list[(i+1) * n]);

    return l;
  }





  Future<List> updateHistoryDate() async
  {


    List history=[];
      LoadCurrency loadCurrency = LoadCurrency();

      history = await loadCurrency.getHistory(
          days, currency.id.toLowerCase().toString());

      prices = history[0];
      market_cap = history[1];
      total_valum = history[2];

      store.clear();

      switch(timeduration) {
      case 1:
        store.addAll(prices.sublist(prices.length - 13, prices.length));
        break;
      case 2:
        store = everyNth(prices,3);
        break;
      case 3:
        store = everyNth(prices, 5);
        break;
      case 4:
        store = everyNth(prices, 12);
        break;
      case 5:
        store = everyNth(prices, 10);
        break;
      case 6:
        store = everyNth(prices, 3);
        break;
      case 7:
        int k = prices.length;
        int m = (k / 100).round();
        store = everyNth(prices, m);
        break;
    }


    currentHistory.clear();
    double o=0;
    for(var i in store)
    {

      DateTime dt = DateTime.parse(i.timeString);

      int time =dt.millisecondsSinceEpoch;


      double price= i.price;


      String p = price.toStringAsFixed(3);

      currentHistory.add(FlSpot(o, double.parse(p)));

      o++;
    }

    List minmax=[];
    for(var i in currentHistory)
    {
      minmax.add(i.y);
    }
    maxY=minmax.reduce((curr, next) => curr > next ? curr : next);
    minY=minmax.reduce((curr, next) => curr < next ? curr : next);


  }
}
