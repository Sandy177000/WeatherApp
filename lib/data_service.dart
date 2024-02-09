import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '819c9a5a5e070642cd928f9f68e8f38d',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    return WeatherResponse.fromJson(jsonDecode(response.body));
  }
}
