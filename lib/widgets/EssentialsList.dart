import 'dart:convert';

import 'package:covid_india_tracker/models/Essential.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class EssentialsList extends StatefulWidget {
  @override
  _EssentialsListState createState() => _EssentialsListState();
}

class _EssentialsListState extends State<EssentialsList> {
  Future<List<Essential>> essentials;

  @override
  void initState() {
    super.initState();
    essentials = fetchEssentials();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Essential>>(
      future: essentials,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text('${snapshot.data[index].organisation}'),
                subtitle: Text('${snapshot.data[index].description}'),
                isThreeLine: true,
                trailing: Icon(Icons.keyboard_arrow_down),
              );
            }
          );
        }else if(snapshot.hasError){
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      }
    );
  }
}

Future<List<Essential>> fetchEssentials() async {
  final response = await http.get('https://api.covid19india.org/resources/resources.json');

  if(response.statusCode == 200){
    Map<String, dynamic> data = json.decode(response.body);
    var resources = data["resources"] as List;
    List<Essential> states = resources.map((json) => Essential.fromJson(json)).toList();
    return states;
  }else{
    throw Exception('Failed to load Data.');
  }
}