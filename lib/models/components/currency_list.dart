import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../constants.dart';
import 'data_provider.dart';

class CurrenyList extends StatefulWidget {
  @override
  _CurrenyListState createState() => _CurrenyListState();
}

class _CurrenyListState extends State<CurrenyList> {
  List loadedCurrenys;
  double size;
  double percentage;

  @override
  Widget build(BuildContext context) {
    loadedCurrenys = ModalRoute.of(context).settings.arguments;
    size = MediaQuery.of(context).size.width-100;
    print(size);

    return Container(
        width: MediaQuery.of(context).size.width,
        child: Consumer<DataProvider>(
          builder: (context, dataprovider, child) => Column(children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: dataprovider.getLoadedCoins.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: Card(
                      elevation: 10,
                      color: Color.fromRGBO(250, 250, 250, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: (){
                            dataprovider.currencySelect(index);
                            Navigator.pushNamed(context, '/inforamtion');
                        },
                        leading: Expanded(
                          flex: 1,
                          child: Container(
                            width: 45,
                            child: Image.network(
                              dataprovider.getLoadedCoinsCurreny(index).image,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                dataprovider.getLoadedCoinsCurreny(index).name,),
                            Text(dataprovider
                                .getLoadedCoinsCurreny(index)
                                .current_price
                                .toString())
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size*130/310,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                        child: Text(
                                                dataprovider
                                                    .getLoadedCoinsCurreny(index)
                                                    .market_cap_rank
                                                    .toString()
                                                    .toUpperCase(),
                                                style: TextStyle(color: Colors.black,backgroundColor: Colors.grey[300],),

                                              ),
                                      ),
                                    ),

                                  ),
                                  Expanded(flex: 2
                                      ,child: SizedBox()),

                                  Expanded(
                                    flex:6,
                                    child: Text(dataprovider
                                        .getLoadedCoinsCurreny(index)
                                        .symbol
                                        .toString()
                                        .toUpperCase()),
                                  ),
                                  Expanded(flex:4,child: SizedBox())

                                ],
                              ),
                            ),
                            Container(
                              width: size*70/310,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: RotatedBox(
                                        quarterTurns: dataprovider.getLoadedCoinsCurreny(index).price_change_percentage_24h > 0 ? 0:2,
                                        child: Icon(
                                          Icons.keyboard_capslock,
                                          color: dataprovider.getLoadedCoinsCurreny(index).price_change_percentage_24h > 0 ? Colors.green:Colors.red,
                                        )),
                                  ),

                                  Expanded(
                                    flex: 15,
                                    child: Text(dataprovider
                                        .getLoadedCoinsCurreny(index)
                                        .price_change_percentage_24h.toString()[0] == ("-") ? dataprovider
                                        .getLoadedCoinsCurreny(index)
                                        .price_change_percentage_24h.toString().substring(1,6)+"%":
                                    dataprovider
                                        .getLoadedCoinsCurreny(index)
                                        .price_change_percentage_24h.toString().substring(0,5)+"%"),
                                  ),
                                ],
                              ),
                            )



                            /*Text('MC ' +
                                dataprovider
                                    .getLoadedCoinsCurreny(index)
                                    .market_cap
                                    .toString())*/
                          ],
                        ),
                        trailing: Icon(Icons.favorite_border),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}

/*

    return Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(dataprovider.getLoadedCoinsCurreny(index).image)),
                            title: Row(children: [
                              Text(dataprovider.getLoadedCoinsCurreny(index).name),
                              Text(dataprovider.getLoadedCoinsCurreny(index).current_price.toString())
                            ],),
                            subtitle: Row(
                              children: [
                                Text(dataprovider.getLoadedCoinsCurreny(index).market_cap_rank.toString().toUpperCase()),
                                Text(dataprovider.getLoadedCoinsCurreny(index).symbol.toString().toUpperCase()),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(
                                      Icons.change_history,
                                      color: Colors.green,
                                    )
                                  ),
                                Text(dataprovider.getLoadedCoinsCurreny(index).price_change_percentage_24h.toString()),
                                Text('MC ' + dataprovider.getLoadedCoinsCurreny(index).market_cap.toString())
                              ],
                            ),
                            trailing: Icon(Icons.favorite),
                            isThreeLine: true,
                          ),
                        ),
                      );
 */
