import 'package:firebase_auth/firebase_auth.dart';

class UserModel{

  String email;
  String name;
  String token;

  UserModel({
    required this.email,
    required this.name,
    required this.token});

factory  UserModel.fromJson(Map<String,dynamic>json)=>UserModel(
    email: json["email"],
    name: json["name"],
    token: json["token"]);
}