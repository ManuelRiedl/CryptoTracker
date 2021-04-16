import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Currency
{
  String id;
  String symbol;
  String name;
  String image;
  num current_price;
  num market_cap;
  num market_cap_rank;
  num fully_diluted_valuation;
  num total_volume;
  num high_24h;
  num low_24h;
  num price_change_24h;
  num price_change_percentage_24h;
  num market_cap_change_24h;
  num market_cap_change_percentage_24h;
  num circulating_supply;
  num total_supply;
  num max_supply;
  num ath;
  num ath_change_percentage;
  String ath_date;
  num atl;
  num atl_change_percentage;
  String atl_date;
  String last_updated;


  Currency(this.id, this.symbol, this.name, this.image, this.current_price,
      this.market_cap, this.market_cap_rank, this.fully_diluted_valuation,
      this.total_volume, this.high_24h, this.low_24h, this.price_change_24h,
      this.price_change_percentage_24h, this.market_cap_change_24h,
      this.market_cap_change_percentage_24h, this.circulating_supply,
      this.total_supply, this.max_supply, this.ath, this.ath_change_percentage,
      this.ath_date, this.atl, this.atl_change_percentage, this.atl_date,
      this.last_updated);

  /*  Student({this.name, this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(name: json['name'], age: json['age']);
  }


*/
 factory Currency.fromJson(Map<String,dynamic> json)
 {
   return Currency(json['id'], json['symbol'],json['name'],json['image'],json['current_price'],json['market_cap']
     ,json['market_cap_rank'],json['fully_diluted_valuation'],json['total_volume'],json['high_24h']
     ,json['low_24h'],json['price_change_24h'],json['price_change_percentage_24h'],json['market_cap_change_24h'],json['market_cap_change_percentage_24h']
     ,json['circulating_supply'],json['total_supply'],json['max_supply'],json['ath'],json['ath_change_percentage']
     ,json['ath_date'],json['atl'],json['atl_change_percentage'],json['atl_date'],json['last_updated']);
/*
   this.fully_diluted_valuation = json['fully_diluted_valuation'];
   this.total_volume = json['total_volume'];
   this.high_24h = json['high_24h'];
   this.low_24h = json['low_24h'];
   this.price_change_24h = json['price_change_24h'];
   this.price_change_percentage_24h = json['price_change_percentage_24h'];
   this.market_cap_change_24h = json['market_cap_change_24h'];
   this.market_cap_change_percentage_24h = json['market_cap_change_percentage_24h'];
   this.circulating_supply = json['circulating_supply'];
   this.total_supply = json['total_supply'];
   this.max_supply = json['max_supply'];
   this.ath = json['ath'];
   this.ath_change_percentage = json['ath_change_percentage'];
   this.ath_date = json['ath_date'];
   this.atl = json['atl'];
   this.atl_change_percentage = json['atl_change_percentage'];
   this.atl_date = json['atl_date'];
   this.roi = json['roi'];
   this.last_updated = json['last_updated'];
   /*
   this.id = json['id'].toString();
   this.symbol = json['symbol'].toString();
   this.name = json['name'].toString();
   this.image = json['image'].toString();
   this.current_price = json['current_price'];
   this.market_cap = json['market_cap'];
   this.market_cap_rank = json['market_cap_rank'];
   */
   */


 }

  @override
  String toString() {
    return 'Currency{id: $id, symbol: $symbol, name: $name, image: $image, market_cap: $market_cap, market_cap_change_24h: $market_cap_change_24h, total_supply: $total_supply}';
  }


/*
  void fromJson(Map<String, dynamic> json) {


    print(json);

    /*
    this.id = json['id'].toString();
    this.symbol = json['symbol'].toString();
    this.name = json['name'].toString();
    this.image = json['image'].toString();
    this.current_price = json['current_price'];
    this.market_cap = json['market_cap'];
    this.market_cap_rank = json['market_cap_rank'];
    this.fully_diluted_valuation = json['fully_diluted_valuation'];
    this.total_volume = json['total_volume'];
    this.high_24h = json['high_24h'];
    this.low_24h = json['low_24h'];
    this.price_change_24h = json['price_change_24h'];
    this.price_change_percentage_24h = json['price_change_percentage_24h'];
    this.market_cap_change_24h = json['market_cap_change_24h'];
    this.market_cap_change_percentage_24h = json['market_cap_change_percentage_24h'];
    this.circulating_supply = json['circulating_supply'];
    this.total_supply = json['total_supply'];
    this.max_supply = json['max_supply'];
    this.ath = json['ath'];
    this.ath_change_percentage = json['ath_change_percentage'];
    this.ath_date = json['ath_date'];
    this.atl = json['atl'];
    this.atl_change_percentage = json['atl_change_percentage'];
    this.atl_date = json['atl_date'];
    this.roi = json['roi'];
    this.last_updated = json['last_updated'];

*/

  }

*/

}