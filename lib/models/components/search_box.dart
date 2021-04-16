import 'package:flutter/material.dart';

import '../../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key, this.onchange,
  }) : super(key: key);
  final ValueChanged onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(kDefaultPadding,5,kDefaultPadding,kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding/4,
      ),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: onchange ,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.white
          ),
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),

        ),
      ),
    );
  }
}
