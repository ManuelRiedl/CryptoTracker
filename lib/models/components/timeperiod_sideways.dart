import 'package:crypto_tracker_v2/models/components/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';


class TimePeriodList extends StatefulWidget {
  @override
  _TimePeriodListState createState() => _TimePeriodListState();
}

class _TimePeriodListState extends State<TimePeriodList> {

  int selectedItem=0;
  List  categories = ['1h','24h','7d','30d','90d','1y','All'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: kDefaultPadding/2,),
      height: 30,
      child: Consumer<DataProvider>(
        builder: (context,dataprovider,child)
        => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedItem = index;
                    dataprovider.setDays2(selectedItem+1);

                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: kDefaultPadding/2,
                      right: index == categories.length -1 ? kDefaultPadding/2:0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: index == selectedItem ? Colors.black : Colors.grey[300],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(categories[index],
                    style: TextStyle(
                      color: index == selectedItem ? Colors.white : Colors.black,
                    ),),

                ),
              );
            }),
      ),
    );
  }
}


