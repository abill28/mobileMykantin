// ignore_for_file: unused_import, file_names, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_kantin/models/model.dart';
// ignore: file_name
class LoginController {
  
  Future login(String nama, String password) async{
    var url= "https://mykantin.giriwangi.com/api/login";

    Map data = {
      "nama": nama,
      "password":password
    };

    var body = json.encode(data);

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type":"application/json"},
      body: body);

    if (response.statusCode == 200) {
      // LoginModel datalogin = loginModelFromJson(response.toString());
      return true;
    } else {
      return false;
    }
  }
}