import 'dart:convert';

import 'package:covid_india_tracker/constant.dart';
import 'package:covid_india_tracker/models/StateData.dart';
import 'package:covid_india_tracker/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CasesWidget extends StatefulWidget {
  @override
  _CasesWidgetState createState() => _CasesWidgetState();
}

class _CasesWidgetState extends State<CasesWidget> {
  Future<List<StateData>> states;
  String stateName = "Total";
  int active = 0;
  int deaths = 0;
  int recovered = 0;

  @override
  void initState() {
    super.initState();
    states = fetchStateWiseData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(0xFFE5E5E5)),
          ),
          child: Row(
            children: <Widget>[
              Image.asset("assets/icons/maps-and-flags.png"),
              SizedBox(width: 20,),
              Expanded(
                child: FutureBuilder<List<StateData>>(
                  future: states,
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Image.asset("assets/icons/dropdown.png"),
                          value: stateName,
                          items: snapshot.data.map<DropdownMenuItem<String>>((StateData stateData){
                            return DropdownMenuItem<String>(
                              value: stateData.name,
                              child: Text(stateData.name),
                            );
                          }).toList(),
                          onChanged: (selectedStateName){
                            setState(() {
                              var stateData = snapshot.data.firstWhere((element) => element.name == selectedStateName);
                              stateName = stateData.name;
                              active = stateData.active;
                              deaths = stateData.deaths;
                              recovered = stateData.recovered;
                            });
                          },
                        );
                    }else if(snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  } 
                )
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                        TextSpan(text: "Newest Update March 28", style: TextStyle(color: kTextLightColor))
                      ]
                    ),
                  ),
                  Spacer(),
                  Text("See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Counter(
                      number: active,
                      color: kInfectedColor,
                      title: "Active",
                    ),
                    Counter(
                      number: deaths,
                      color: kDeathColor,
                      title: "Deaths",
                    ),
                    Counter(
                      number: recovered,
                      color: kRecovercolor,
                      title: "Recovered",
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ); 
  }
}

Future<List<StateData>> fetchStateWiseData() async {
  final response = await http.get('https://api.covid19india.org/data.json');

  if(response.statusCode == 200){
    Map<String, dynamic> data = json.decode(response.body);
    var stateWiseData = data["statewise"] as List;
    List<StateData> states = stateWiseData.map((json) => StateData.fromJson(json)).toList();
    return states;
  }else{
    throw Exception('Failed to load Data.');
  }
}