import 'package:http/http.dart' as http;
import 'package:my_kantin/models/hutang.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static String baseUrl = "http://172.16.80.156:5000";

  static Future getHutang()async{
    Uri url = Uri.parse(baseUrl+"/data/hutang",);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await http.get(url,headers:{
      "Authorization":"Bearer ${prefs.getString("token")}"
    } );
    print(res.statusCode);
    if(res.statusCode == 200){
      return hutangFromJson(res.body);
      
    }else{
      return false;
    }
  }
}

