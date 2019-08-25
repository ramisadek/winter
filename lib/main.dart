import 'package:flutter/material.dart';
import 'package:winter/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:winter/services/weather_model.dart';




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

  bool isClicked = false;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    WeatherModel weatherModel = WeatherModel();
    var data= await weatherModel.getLocationData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: data,);
    }));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.cyan,
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset('assets/icons/Icon.png',scale: 12,),
//            Text(widget.title)
//          ],
//        ),
//        centerTitle: true,
//      )
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.green,
          size: 100.0,
        ),
      ),
    );
  }
}
