import 'package:flutter/material.dart';
import 'package:winter/utilities/constants.dart';
import 'package:winter/services/weather_model.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {

  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel wModel = WeatherModel();
  double weatherC;
  String weatherIcon;
  String city;
  String status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic data){
    setState(() {
      weatherC=data['main']['temp'];
      var condition=data['weather'][0]['id'];
      weatherIcon=wModel.getWeatherIcon(condition);
      city=data['name'];
      status=data['weather'][0]['main'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: weatherC<=18? [Color(0xFF373B44),Color(0xFF4286f4)] :  [Color(0xFFff512f),Color(0xFFdd2476)],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var wd = await wModel.getLocationData();
                      updateUI(wd);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  Text("$city",style: kMessageTextStyle.apply(color: Colors.amber),),
                  Text("  "),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0,top: 150),
                child: Row(
                  children: <Widget>[
                    Text("$weatherIcon",style: kTempTextStyle,),
                    Text("$status",style: TextStyle(fontSize: 40,color: Colors.white,fontFamily: 'Spartan MB'),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  '${weatherC.floor()}°',
                  style: kTempTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
