import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:analog_clock/analog_clock.dart';

class fingerprintPage extends StatelessWidget {

  goBackToPreviousScreen(BuildContext context){

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("")),
    body: Center(

      child: Container(


        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://e7.pngegg.com/pngimages/196/813/png-clipart-fingerprint-logo-others-miscellaneous-text.png'),
          ),
        ),


        child: Column(children: [


         /*  AnalogClock(
            decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.black),
                color: Colors.black,
                shape: BoxShape.circle),
            width: 200.0,
            isLive: true,
            hourHandColor: Colors.white,
            minuteHandColor: Colors.white,
            showSecondHand: true,
            numberColor: Colors.white,
            showNumbers: true,
            textScaleFactor: 1.5,
            showTicks: true,
            showDigitalClock: true,
            digitalClockColor: Colors.white,
            datetime: DateTime(2020, 8, 4, 9, 11, 0),
          ),
*/
        FlatButton(

        padding: EdgeInsets.all(0.0),

        onPressed: () {


        }, child: Text(""),

      ),




        ],)




      ),

    )

    );
  }
}