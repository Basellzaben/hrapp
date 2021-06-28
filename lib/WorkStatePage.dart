import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkStatePage extends StatelessWidget {
  late BuildContext mcontext;
  goBackToPreviousScreen(BuildContext context){
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    mcontext=context;
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(title: Text("حــالة دوام الموظف")),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 33.0,bottom: 0.0),

            child: Column(children: [

              Align(
                alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline5,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(Icons.date_range),
                      ),
                    ),
                    TextSpan(text: '24/6/2021',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black,),),
                  ],
                ),
              )
              ),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                children: <Widget>[
                Container(
                  width:60,
                  height: 60,
                  color: Colors.pink,
                  child: Center(
                    child: Text(
                    "15",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                  ),),),
                  Expanded(
                      child: Text(
                        "الدوام الـكامل",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                      ))
                ],
              )
            ),

           Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                          child: Text(
                            "الدوام الـكامل",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                          ))
                    ],
                  )
              ),


              Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                          child: Text(
                            "الدوام الـكامل",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                          ))
                    ],
                  )
              ),



                  Container(
                      margin: const EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.purple,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                          Expanded(
                              child: Text(
                                "الدوام الـكامل",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                              ))
                        ],
                      )
                  ),



                  Container(
                      margin: const EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.amber,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                          Expanded(
                              child: Text(
                                "الدوام الـكامل",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                              ))
                        ],
                      )
                  ),





                ]   ,),)



/*
              Container(
                margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 20.0,bottom: 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('تسجيل الدخول'),
                  )
              ),


*/




            /*  Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 0.0),
                child: Text(getSystemTime(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
              ),*/
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
/*
              Container( child: Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

                child: Material(
                  child: GestureDetector(
                    onTap: () {

                      // makePostRequest();

                      *//*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("تم تسجيل الدخول بنجاح"),
                  ),);*//*
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child:Image.network('https://image.flaticon.com/icons/png/512/25/25936.png',
                            width: 200.0, height: 200.0),

                      ),
                    ),
                  ),
                ),),),*/



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

  }}
