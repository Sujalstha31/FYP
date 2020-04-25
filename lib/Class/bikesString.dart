
import 'package:flutter/material.dart';
class Bike {
  final String id;
  final String name,
      imageUrl,
      price,
      lot,
      kilometer,
      modelYear,
      uname,
      number,
      address,
      tax,
      desciption;

  Bike(
      {this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.lot,
      this.desciption,
      this.kilometer,
      this.modelYear,
      this.address,
      this.uname,
      this.tax,
      this.number});

  factory Bike.fromJson(Map<String, dynamic> jsonData) {
    return Bike(
      id: jsonData['id'],
      name: jsonData['names'],
      price: jsonData['price'],
      lot: jsonData['lot'],
      modelYear: jsonData['modelYear'],
      kilometer: jsonData['kilometer'],
      desciption: jsonData['desciption'],
      uname: jsonData['uname'],
      number: jsonData['number'],
      address: jsonData['address'],
      tax: jsonData['tax'],
      imageUrl:
          "http://10.0.2.2/PHP/spacecrafts/images/" + jsonData['image_url'],
    );
  }
}
