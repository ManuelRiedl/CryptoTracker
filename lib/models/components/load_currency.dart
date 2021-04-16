import 'dart:collection';
import 'dart:convert';

import 'package:crypto_tracker_v2/models/components/history_crypto_currency.dart';
import 'package:crypto_tracker_v2/models/components/currency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class LoadCurrency {


  Future<List> getHistory(int period,String name) async
  {
    List history =[];
    List p =[];
    List m =[];
    List t =[];


    Response response = await get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$name/market_chart?vs_currency=eur&days=$period'));
    print("-------------------------");
    print(name);
    print(period);
print("-------------------------");
   Map json =jsonDecode(response.body);

   /* print(json['total_volumes']);
    print(json['total_volumes'][2]);
    print(json['total_volumes'][2][0]);
*/


   var prices = json['prices'];
   var mc = json['market_caps'];
   var totalvolum =json['total_volumes'];



    for(int i =0;i<prices.length; i++)
     {
       var date = DateTime.fromMillisecondsSinceEpoch(prices[i][0]);


       p.add(HistoryCryptoCurrency(date, prices[i][1] as double));

     }

   history.add(p);





    for(int i =0;i<prices.length; i++)
    {
      var date = DateTime.fromMillisecondsSinceEpoch(prices[i][0] * 1000);


      m.add(HistoryCryptoCurrency(date, mc[i][1] as double));
    }

    history.add(m);



    for(int i =0;i<prices.length; i++)
    {

      var date = DateTime.fromMillisecondsSinceEpoch(prices[i][0] * 1000);

      t.add(HistoryCryptoCurrency(date, totalvolum[i][1] as double));
    }

    history.add(t);
    print(history[0][0].price);
    return history;
  }



  Future<List<Currency>> getCurrencyList(int per_page, int page) async
  {
    List<Currency> coins = List<Currency>();


    Response response = await get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$per_page&page=$page'));


    final json = jsonDecode(response.body);

    if (json != null) {
      json.forEach((element) {
        final curreny = Currency.fromJson(element);
        coins.add(curreny);
      });
    }
    return coins;
  }

  Future<Currency> getSingleCurrency(String name) async
  {
    Response response = await get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&ids=$name'));


    final json = jsonDecode(response.body);

    if (json != null) {
      json.forEach((element) {
        final curreny = Currency.fromJson(element);
        return curreny;
      });
    }
  }

}


      //List<dynamic> jsonData = new List<dynamic>();

      //jsonData = jsonDecode(response.body);


      //   currency.fromJson(jsonDecode(response.body));
      /*
      if(jsonData.length >0)
        {
          for(int i =0; i<per_page; i++)
          {
            if(jsonData[i] != null)
             {
               Map<dynamic,dynamic> map = jsonData[i];
               coins.add(currency.fromJson(map));
             }
          }
        }




/*
      for(var c in jsonData)
        {
          Currency currency = Currency(c['id'],c['symbol'],c['image'],double.parse(c['current_price']),double.parse(c['market_cap']),int.parse(c['market_cap_rank']),int.parse(c['fully_diluted_valuation']),int.parse(c['total_colum']),double.parse(c['high_24h']),double.parse(c['low_24h']),double.parse(c['price_change_24h']),double.parse(c['price_change_percentage_24h']),double.parse(c['market_cap_change_24h']),double.parse(c['market_cap_change_percentage_24h']),int.parse(c['circulating_supply']),int.parse(c['total_supply']),double.parse(c['ath']),double.parse(c['ath_change_percentage']),c['ath_date'],double.parse(c['atl']),double.parse(c['atl_change_percentage']),c['atl_date'],c['roi'],c['last_update']);
        coins.add(currency);
        }
*/

    }catch(e)
    {
      print('-----------------------------------');
      print('ERROR $e');
      print('-----------------------------------');
    }


    for(int i=0; i<coins.length;i++)
      {
        print('-----------------------------------');

        print('___________COIN_____________');
        print(coins[i].toString());

        print('-----------------------------------');


      }
      */


