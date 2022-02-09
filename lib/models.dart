//Models

//Weather info object
class WeatherInformation {
  final String description;
  final String icon;

  WeatherInformation({required this.description, required this.icon});

  factory WeatherInformation.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInformation(description: description, icon: icon);
  }
}
//Object for temp info, needs to be double
class TempeInfo {
  final double temperature;

  TempeInfo({required this.temperature});

  factory TempeInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TempeInfo(temperature: temperature);
  }
}
//Need to parse json, pulling the info out of it
class WeatherResponse {
  final String cityName;
  final TempeInfo tempInfo;
  final WeatherInformation weatherInfo;
  //Getting the image url from WeatherResponse
  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo});
  //Pulling out with factory (custom constructor)
  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    //Objects that we are passing into WeatherResponse constructor
    final tempInfoJson = json['main'];
    final tempInfo = TempeInfo.fromJson(tempInfoJson);
    //Array, getting the first index
    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInformation.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}

/*
{
"coord": {
"lon": -122.08,
"lat": 37.39
},
"weather": [
{
"id": 800,
"main": "Clear",
"description": "clear sky",
"icon": "01d"
}
],
"base": "stations",
"main": {
"temp": 282.55,
"feels_like": 281.86,
"temp_min": 280.37,
"temp_max": 284.26,
"pressure": 1023,
"humidity": 100
},
"visibility": 16093,
"wind": {
"speed": 1.5,
"deg": 350
},
"clouds": {
"all": 1
},
"dt": 1560350645,
"sys": {
"type": 1,
"id": 5122,
"message": 0.0139,
"country": "US",
"sunrise": 1560343627,
"sunset": 1560396563
},
"timezone": -25200,
"id": 420006353,
"name": "Mountain View",
"cod": 200
}
*/
