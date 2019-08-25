import 'location.dart';
import 'networking.dart';



class WeatherModel {

  String apiKey='f633f75a3742406ae26270728c2a7ed0';

  Future<dynamic> getLocationData() async {
    Location location= Location();
    await location.getLocation();
    NetworkHelper nH = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric');
    var data = await nH.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
