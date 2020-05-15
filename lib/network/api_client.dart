import 'package:covid19_stats/config/env.dart';
import 'package:covid19_stats/model/covid19_per_provinsi.dart';
import 'package:http/http.dart';

// TODO 06 : create API client

class ApiClient {
  static Future<Covid19PerProvinsi> getCovid19PerProvinsiId() async {
    Response _response = await get("${Env.baseUrl}/provinsi");
    if (_response.statusCode == 200) {
      return Covid19PerProvinsi.fromJson(_response.body);
    } else {
      throw Exception("error code : ${_response.statusCode}");
    }
  }
}