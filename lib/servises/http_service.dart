import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:weather/constantas.dart';
import 'package:weather/models/api_response_model.dart';
import 'package:weather/models/weather_response_model.dart';
import 'http_helper.dart';

//https://api.openweathermap.org/data/2.5/weather?q=London&appid=7d9ce0c56aacd2046c09de656873558a

class Network {
  static bool isTester = true;
  static String SERVER_API_WEATHER = "api.weatherapi.com";

  static String API_WEATHER_LOCATION = "//v1/current.json";
  static String API_WEATHER_PROGNOZ="/v1/current.json";


  static final client = InterceptedClient.build(
    interceptors: [HttpInterceptor()],
    retryPolicy: HttpRetryPolicy(),
  );

  static Map<String,dynamic> paramsWeatherKey() {
    Map<String, String> params = {};
    params.addAll({
      'q': "London",
      'key': API_WEATHER_KEY,
    });

    return params;
  }



  /* Http Requests */
  static Future<String?>GET(String api, Map<String,dynamic> params ) async {
    try {
      var uri = Uri.http(SERVER_API_WEATHER, api, paramsWeatherKey() );
      var response = await client.get(uri,);
      if (response.statusCode == 200) {
        print( response.body);
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }
// final response = await http.get(Uri.parse(apiUri));
  static Future<String?> POST(String api, Map<String,dynamic> body) async {
    try {
      var uri = Uri.https(SERVER_API_WEATHER,api,paramsWeatherKey());
      var response = await client.post(uri,body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(SERVER_API_WEATHER, api, params);
      var response = await client.delete(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static _throwException(Response response) {
    String reason = response.reasonPhrase!;
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(reason);
      case 401:
        throw InvalidInputException(reason);
      case 403:
        throw UnauthorisedException(reason);
      case 404:
        throw FetchDataException(reason);
      case 500:
      default:
        throw FetchDataException(reason);
    }
  }

  /* Http Apis*/
 // static String API_WEATHER_LOCATION = "/v1/current.json";

  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  //limit=20&page=0&order=DESC


//*HttpParsing*/
  static ApiWeatherModel parseWeatherList(String response) {
  dynamic json = jsonDecode(response);
  return ApiWeatherModel.fromJson(json);
}
}
