
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/constantas.dart';
import 'package:weather/models/weather_response_model.dart';
//https://api.weatherapi.com/v1/current.json?key=4c4144304625438fa42124146240512&q=London
class WeatherApi {
  final String baseUrl ='http://api.weatherapi.com/v1/current.json';

  Future<WeatherResponse> getCurrentWeather(String location) async {
    String apiUri = '$baseUrl?key=$API_WEATHER_KEY&q=$location';

    try {
      final response = await http.get(Uri.parse(apiUri));

      if (response.statusCode == 200) {
       // print(response);
       return WeatherResponse.fromJson(jsonDecode(response.body));

        // Ma'lumotni JSON formatida o'qing
        return WeatherResponse.fromJson(jsonDecode(response.body));
      } else {
        // HTTP xatolarni qaytarish
        throw Exception(
            'Failed to load weather. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // HTTP chaqiruvdagi boshqa xatolar
      print('Error in getCurrentWeather: $e');
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
