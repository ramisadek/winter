import 'package:geolocator/geolocator.dart';

class Location{
  double long;
  double lat;
  Future<void> getLocation() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    long=position.longitude;
    lat=position.latitude;
  }
}