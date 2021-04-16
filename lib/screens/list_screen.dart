import 'package:crypto_tracker_v2/constants.dart';
import 'package:crypto_tracker_v2/models/components/categories_sidewaylist.dart';
import 'package:crypto_tracker_v2/models/components/currency_list.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker_v2/models/language/language.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body:SafeArea(
        child: Column(
          children: <Widget>[
            // SearchBox(),
            Categorylist(),
            SizedBox(height: kDefaultPadding/2,),
            Expanded(child: CurrenyList())
          ],
        ),
      ) ,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Cryptoassats',
        style: TextStyle(fontSize: 25),
      ),

      centerTitle: false,
      actions: <Widget>
        [IconButton(
            onPressed: ()
            {

            },
            icon: Icon(Icons.notifications_none))],
    );
  }
}
