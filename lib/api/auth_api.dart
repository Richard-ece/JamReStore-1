import 'package:dio/dio.dart';

class AuthApi {
  final backendPath = "http://localhost:4000/api";
  
  Future<dynamic> signIn ({required String email, required String password}) {
    return Dio().post("${backendPath}/auth/signIn", 
      data:{
      "email":email,
      "password":password
      });
  }

   Future<dynamic> SignUp ({required String email, required String password, required String name}) {
    return Dio().post("${backendPath}/auth/signUp", 
      data:{
      "email":email,
      "password":password,
      "name" :name
      });
  }
}