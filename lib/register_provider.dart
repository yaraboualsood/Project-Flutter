import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/register_model.dart';

class RegisterProvider with ChangeNotifier{
  RegisterModel?registerModel;
  Map<String,dynamic>? data;
  Future<dynamic>register({
    String? name,
    String?email,
    String?password,
    String?phone,
  })async{
        var dio=Dio();
     dio.options.headers={
      "lang":"ar",
      "Content-Type":"application/json"
     };
     data={
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
     };
     notifyListeners();
     final response=await dio.post("https://student.valuxapps.com/api/register",
     data: data,
     ); 
     print("data register "+response.data.toString());
    registerModel=RegisterModel.fromJson(response.data);

  }  
}



















// class RegisterProvider with ChangeNotifier{
//  RegisterModel? registerModel; 
//   String? token; 
//     Map<String,dynamic>? data;
//   Future<dynamic>register({
//     String? name,
//     String? phone,
//     String? email,
//     String? password,  
     
//   })async{
//     var dio=Dio();
//     dio.options.headers={
//       "lang":"en",
//       "Content-Type":"application/json",
//       "Authorization":token,

//     };
//     data={
//       "name":name,
//       "phone":phone,
//       "email":email,
//       "password":password
//     };
//     notifyListeners();
   

    
//    final response= await dio.post("https://student.valuxapps.com/api/register",data: data);
//    print("res"+response.data["message"]);
//     registerModel=RegisterModel.fromJson(response.data);
//     notifyListeners();
//   }

// }



















