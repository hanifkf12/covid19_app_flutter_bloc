
import 'package:http/http.dart' as http;
import 'package:covid19app/model_data/case_indonesia.dart';
import 'package:covid19app/model_data/case_province.dart';

class NetworkProvider{
  final baseUrl = "https://api.kawalcorona.com/";
  Future<List<CaseIndonesia>> getCase() async{
    final response = await http.get("${baseUrl}indonesia/");
    if(response.statusCode==200){
      print(response.body);
      return caseIndonesiaFromJson(response.body);
    }else{
      throw Exception('Failed to Load Post');
    }
  }
}
