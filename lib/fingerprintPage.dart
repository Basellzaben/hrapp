import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class fingerprintPage extends StatelessWidget {
  late BuildContext mcontext;
  goBackToPreviousScreen(BuildContext context){
    Navigator.pop(context);

  }
  @override
  Widget build(BuildContext context) {
    mcontext=context;
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(title: Text("بصمة الدوام الالكترونية")),
    body: Center(

      child: Container(

        child: Column(children: [


    /*      Container(
            child: DigitalClock(
              digitAnimationStyle: Curves.elasticOut,
              is24HourTimeFormat: false,
              areaDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitTextStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: 50,
              ),
              amPmDigitTextStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
          ),*/



    Container(
            margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 0.0),

            child: Text(getSystemTime(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),

          ),

/*
        Container(
        margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 40.0),
          child: FlutterAnalogClock(
            dateTime: DateTime.now(),
        dialPlateColor: Colors.white,
        hourHandColor: Colors.black,
        minuteHandColor: Colors.black,
        secondHandColor: Colors.black,
        numberColor: Colors.black,
        borderColor: Colors.black,
        tickColor: Colors.black,
        centerPointColor: Colors.black,
        showBorder: true,
        showTicks: true,
        showMinuteHand: true,
        showSecondHand: true,
        showNumber: true,
        borderWidth: 8.0,
        hourNumberScale: .10,
        hourNumbers: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        isLive: true,
        width: 150.0,
        height: 150.0,
        decoration: const BoxDecoration(),
            child:Text("")

        )),*/

          Container( child: Container(
            margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

            child: Material(
              child: GestureDetector(
                onTap: () {

                 // makePostRequest();

               /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("تم تسجيل الدخول بنجاح"),
                  ),);*/
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child:Image.network('https://image.flaticon.com/icons/png/512/25/25936.png',
                        width: 200.0, height: 200.0),

                  ),
                ),
              ),
            ),),),



/*Container(
  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),
       child: FlatButton(

        padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("تم تسجيل الدخول بنجاح"),
          ));


        }, child: Text(""),

      ),),*/

        ],),

      ),

    )

    );

  }

  String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat("H:m:s").format(now);
  }


  /*getData() async {
    var myUrl = "https://api.jsonbin.io/b/5e1219328d761771cc8b9394" ;
    var req = await http.get(myUrl);
   String infos = json.decode(req.body);
    print(infos['name']);
    return infos['name'];
  }
*/

  makePostRequest(String usernamen,String password) async {

    final uri = Uri.parse('http://httpbin.org/post');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'username': usernamen, 'password': password};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    String responseBody = response.body;


    ScaffoldMessenger.of(mcontext).showSnackBar(SnackBar(
      content: Text(responseBody),

    ),);




  }

}