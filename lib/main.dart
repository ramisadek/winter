import 'package:flutter/material.dart';

import 'location.dart';
import 'networking.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winter',
      home: MyHomePage(title: 'Winter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double longtitude;
  double latitude;
  String apiKey='f633f75a3742406ae26270728c2a7ed0';


  bool isClicked = false;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location= Location();
    await location.getLocation();
    longtitude=location.long;
    latitude=location.lat;
    NetworkHelper nH = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$apiKey');
    var data = await nH.getData();
    print(data['sys']['country']);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/icons/Icon.png',scale: 12,),
            Text(widget.title)
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
