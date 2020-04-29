import 'package:covid_india_tracker/constant.dart';
import 'package:covid_india_tracker/widgets/header.dart';
import 'package:covid_india_tracker/widgets/preventioncard.dart';
import 'package:covid_india_tracker/widgets/symptomcard.dart';
import 'package:flutter/material.dart';


class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(
                  image: "assets/icons/coronadr.png",
                  textTop: "Get to know",
                  textBottom: "About Covid-19.",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Symptoms",
                        style: kTitleTextstyle,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SymptomCard(
                            image: "assets/images/headache.png",
                            title: "Headache",
                            isActive: true,
                          ),
                          SymptomCard(
                            image: "assets/images/caugh.png",
                            title: "Cough",
                          ),
                          SymptomCard(
                            image: "assets/images/fever.png",
                            title: "Fever",
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Prevetion", style: kTitleTextstyle),
                      SizedBox(height: 20,),
                      PreventionCard(
                        image: "assets/images/wear_mask.png",
                        title: "Wear face mask",
                        text: "Since the start of the coronavirus some places have fully embraced wearing facemask.",
                      ),
                      PreventionCard(
                        image: "assets/images/wash_hands.png",
                        title: "Wash your hands",
                        text: "Since the start of the coronavirus some places have fully embraced wearing facemask.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
  