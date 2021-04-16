import 'package:crypto_tracker_v2/models/components/data_provider.dart';
import 'package:crypto_tracker_v2/screens/information_screen.dart';
import 'package:crypto_tracker_v2/screens/list_screen.dart';
import 'package:crypto_tracker_v2/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<DataProvider>(create: (context) => DataProvider())],
      child: MaterialApp(
        routes: {
          '/':(context) => LoadingScreen(),
          '/lists': (context)  =>ListScreen(),
          '/inforamtion': (context) => InformationScreen()
        },
        debugShowCheckedModeBanner: false,
        title: 'Custom crytoassat tracker',
        theme: ThemeData(
          // We set Poppins as our default font
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: ListScreen(),
      ),
    );
  }
}