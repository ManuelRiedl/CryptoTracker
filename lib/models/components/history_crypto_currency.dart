class HistoryCryptoCurrency
{
  double _price;
  var _time;

  HistoryCryptoCurrency( this._time,this._price);

  String get time => _time;
  String get timeString => _time.toString();

  set time(String value) {
    _time = value;
  }

  @override
  String toString() {
    return 'HistoryCryptoCurrency{_price: $_price, _time: $_time}';
  }


  double get price => _price;

  set price(double value) {
    _price = value;
  }


}