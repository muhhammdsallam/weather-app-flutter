import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clima/screens/loading_screen.dart';
import 'weather.dart';

class NetworkHelper {
  NetworkHelper({this.lat, this.long, this.cityName});
  final double lat;
  final double long;
  final String cityName;

  Future getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getCityData() async {
    var urll = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    http.Response response = await http.get(urll);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
