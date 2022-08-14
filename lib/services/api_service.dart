import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class APIService{


  Future<WeatherModel?> getDataWeather(String cityName) async{
    String _path = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=22ba7a8b1469e0947bdc757870693292";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> weatherMap = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(weatherMap);
      return weatherModel;
    }
    return null;
  }

  Future<WeatherModel?> getDataWeatherLocation(Position position) async{
    String _path = "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=22ba7a8b1469e0947bdc757870693292";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> weatherMap = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(weatherMap);
      return weatherModel;
    }
    return null;
  }




}