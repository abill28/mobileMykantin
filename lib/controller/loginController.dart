// ignore_for_file: unused_import, file_names, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_kantin/apiService.dart';
import 'package:my_kantin/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: file_name
class LoginController {
  
  Future login(String nama, String password) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var url= ApiService.baseUrl;

    Map data = {
      "nama": nama,
      "password":password
    };

    var body = json.encode(data);

    final response = await http.post(
      Uri.parse(url+"/login"),
      headers: {"Content-Type":"application/json"},
      body: body);

    if (response.statusCode == 200) {
      // LoginModel datalogin = loginModelFromJson(response.toString());
      await prefs.setString("token", jsonDecode(response.body)["token"]);
      return true;
    } else {
      return false;
    }
  }
}