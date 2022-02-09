import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_stipe_app/models.dart';

//Fetching the weather
class ApiService {
  Future<WeatherResponse> grabWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    //Splitting the api call in to query parameters
    final queryParameters = {
      'q': city,
      'appid': '3da71e800856fb77e48ffabb094bcdd8',
      'units': 'metric'
    };
    //1-Main part, 2-Path, 3-Query parameter
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    //Getting the response
    final response = await http.get(uri);

    print(response.body);
    //Decoding json
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}