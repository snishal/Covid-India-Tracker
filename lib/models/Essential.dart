class Essential {
  final String category;
  final String city;
  final String contact;
  final String description;
  final String organisation;
  final String phoneNumber;
  final String state;

  Essential({this.category, this.city, this.contact, this.description, this.organisation, this.phoneNumber, this.state});
  
  factory Essential.fromJson(Map<String, dynamic> json){
    return Essential(
      category: json['category'],
      city: json['city'],
      contact: json['contact'],
      description: json['descriptionandorserviceprovided'],
      organisation: json['nameoftheorganisation'],
      phoneNumber: json['phonenumber'],
      state: json['state']
    );
  }
}