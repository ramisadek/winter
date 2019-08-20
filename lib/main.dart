import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'location.dart';


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

  bool isClicked = false;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location= Location();
    await location.getLocation();
    print(location.long);
    print(location.lat);
  }

  void getData() async{
    Response data= await get('https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22');
    print(data.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
      body: Center(
        child: RaisedButton(
          child: Text("hello"),
        ),
      )
    );
  }
}
