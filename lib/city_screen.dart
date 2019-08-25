import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: IconButton(icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context,city),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,left: 40,right: 40),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search,size: 50,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blueAccent,width: 3)
                    ),
                  ),
                  onChanged: (value){
                    city=value;
                  },
                )
              )
            ],
          ),
        ],
      )
    );
  }
}
