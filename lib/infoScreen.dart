import 'package:covid_india_tracker/constant.dart';
import 'package:covid_india_tracker/widgets/header.dart';
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

class PreventionCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventionCard({
    Key key, this.image, this.title, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 150,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  )
                ]
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(fontSize: 14),
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/icons/forward.png"),
                    ) 
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key, this.image, this.title, this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive 
          ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
          : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90,),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}  