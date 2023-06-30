import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uId;
  String? name;
  String? company;
  String? age;


  UserModel({
    this.uId,
    this.name,
    this.company,
    this.age,

  });

  UserModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    uId = json.id;
    name = json.data()['name'];
    company = json.data()['company'];
    age = json.data()['age'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'company': company,
      'age': age,
    };
  }
}