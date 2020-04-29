import 'package:covid_india_tracker/constant.dart';
import 'package:covid_india_tracker/widgets/CasesWidget.dart';
import 'package:covid_india_tracker/widgets/EssentialsList.dart';
import 'package:covid_india_tracker/widgets/header.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor)
        )
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              image: "assets/icons/Drcorona.png",
              textTop: "All you need",
              textBottom: "is stay at home.",
            ),
            CasesWidget(),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Essentials", style: kTitleTextstyle,),
                  Text(
                    "See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600
                    ),  
                  )
                ],
              ),  
            ),
            EssentialsList(),
          ],
        ),
      ),
    );
  }
}