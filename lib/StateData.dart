class StateData{
  final String name;
  final int active;
  final int deaths;
  final int recovered;

  StateData({this.name, this.active, this.deaths, this.recovered});

  factory StateData.fromJson(Map<String, dynamic> json){
    return StateData(
      name: json['state'],
      active: int.parse(json['active']),
      deaths: int.parse(json['deaths']),
      recovered: int.parse(json['recovered'])
    );
  }
}