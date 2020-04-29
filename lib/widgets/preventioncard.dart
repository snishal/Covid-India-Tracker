import 'package:covid_india_tracker/constant.dart';
import 'package:flutter/material.dart';


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