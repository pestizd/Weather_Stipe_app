import 'package:weather_stipe_app/api_service.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  //Instance of the data service
  final _apiService = ApiService();
  //Storing the response
  WeatherResponse? _response;

  /*@override
  void initState() {
    _response;
    super.initState();
  }*/
  //The layout of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.tealAccent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Weather App', style: TextStyle(fontSize: 30.0, color: Colors.black),),
                const SizedBox(height: 30.0,),
                if (_response != null) //If we have a response we show the weather!
                  Column(
                    children: [
                      Image.network(_response!.iconUrl),
                      Text(
                        '${_response!.tempInfo.temperature}°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response!.weatherInfo.description),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: SizedBox(
                    width: 320.0,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: const InputDecoration(labelText: 'Enter a city', border: OutlineInputBorder(),),
                        textAlign: TextAlign.center),


                  ),

                ),
                ElevatedButton(child: const Text('Search', style: TextStyle(fontSize: 18.0),), onPressed: _search, style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(120.0, 15.0, 120.0, 15.0)),
                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 10))), )
              ],
            ),
          ),
        ));
  }
  //Grabing the weather from data service -- when it's an async function we need to await
  void _search() async {
    final response = await _apiService.grabWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}