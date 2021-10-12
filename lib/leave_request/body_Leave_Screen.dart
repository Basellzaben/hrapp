
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:intl/intl.dart';

import '../LanguageProvider.dart';
import '../LanguageProvider.dart';
import '../LanguageProvider.dart';
import '../homePage.dart';
import 'mainLeaveScreen.dart';

class body_LeaveScreen extends StatefulWidget {
  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),);
  }
  @override
  _body_LeaveScreen createState() => _body_LeaveScreen();
}
goBackToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}

class _body_LeaveScreen extends State<body_LeaveScreen> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  TextEditingController longtimecontroler = TextEditingController();
  String date="";
  String timelong="";

  @override
  Widget build(BuildContext context) {
    goBackToPreviousScreen(BuildContext context) {
      Navigator.pop(context);
    }

    getdate();

    return Scaffold(
        appBar: AppBar(title: Text(
            LanguageProvider.getTexts('leaverequest').toString(),
         /*   textDirection: TextDirection.ltr*/),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homePage()),),
          ),
          // goBackToPreviousScreen();
        ),
        // appBar: AppBar(title: Text("")),
        body:Directionality(
         textDirection: LanguageProvider.getDirection(),
        child: SingleChildScrollView(

        //   padding: EdgeInsets.all(30.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

            Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
height: 100,
              child: Card(
                  elevation: 4.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

           Align(
              child: Container(
                  alignment: LanguageProvider.Align(),
                    margin: const EdgeInsets.all(5),
                  //  alignment: Alignment.center,
          child: Row(
                children: [
    /* Text(

                    LanguageProvider.getTexts('Name').toString(),
                     textDirection: LanguageProvider.getDirection(),
                    style: new TextStyle(
                      fontSize: 15.0, //#e7e7df
                      color:Colors.black54,
                    ),
                  ),

*/              Row(
                       children: <Widget>[
                         Icon(Icons.account_circle_rounded,color:Colors.black54 ),
                         Text(
                           "",
                           textDirection: LanguageProvider.getDirection(),
                           style: new TextStyle(
                             fontSize: 15.0, //#e7e7df
                             color:Colors.black54,
                           ),
                         ),
                       ]
                   ),
                  Text(
                 Globalvireable.name,
                    textDirection: LanguageProvider.getDirection(),

                    style: new TextStyle(
                      fontSize: 15.0, //#e7e7df
                      color:Colors.black87,
                    ),
                  )




])
              ),),

           Align(
              child: Container(
                  alignment: LanguageProvider.Align(),

                  margin: const EdgeInsets.only(top: 18, left: 5, right: 5),

                  //  alignment: Alignment.center,
                  child: Row(
                      children: [
                        /* Text(

                    LanguageProvider.getTexts('Name').toString(),
                     textDirection: LanguageProvider.getDirection(),
                    style: new TextStyle(
                      fontSize: 15.0, //#e7e7df
                      color:Colors.black54,
                    ),
                  ),

*/              Row(
                            children: <Widget>[
                              Icon(Icons.date_range,color:Colors.black54 ),
                              Text(
                                "",
                                textDirection: LanguageProvider.getDirection(),
                                style: new TextStyle(
                                  fontSize: 15.0, //#e7e7df
                                  color:Colors.black54,
                                ),
                              ),
                            ]
                        ),
                        Text(
                          date,
                          textDirection: LanguageProvider.getDirection(),

                          style: new TextStyle(
                            fontSize: 15.0, //#e7e7df
                            color:Colors.black87,
                          ),
                        )




                      ])

              ),),





                      ])),
            ),

            Container(
                margin: const EdgeInsets.only(top: 10, left: 5, right: 5,bottom: 20),
             child: Card(
                elevation: 4.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

          Align(
              child: Container(
                  margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  //  alignment: Alignment.center,
                  child: TextField(

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hexToColor("#415440"), width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)

                      ),


                      contentPadding: EdgeInsets.only(
                          top: 18, bottom: 18, right: 20, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: LanguageProvider.getTexts('Departuretype').toString(),

                    ),
                  )




              )),






          Container(
              margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child:Center(
                  child:TextField(
                    controller: timeinput, //editing controller of this TextField
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hexToColor("#415440"), width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)

                      ),


                      contentPadding: EdgeInsets.only(
                          top: 18, bottom: 18, right: 20, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: LanguageProvider.getTexts('Departurestarttime').toString(),

                    ),
                    readOnly: true,  //set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if(pickedTime != null ){
                        print(pickedTime.format(context));   //output 10:51 PM
                        DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime = DateFormat('HH:mm').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          timeinput.text = formattedTime; //set the value of text field.

                          calculatelongtimee();

                        });
                      }else{
                        print("Time is not selected");
                      }
                    },
                  )
              )
          ),
          Container(
              margin: const EdgeInsets.only(top: 25, left: 20, right: 20),

              child:Center(
                  child:TextField(
                     controller: timeout, //editing controller of this TextField
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hexToColor("#415440"), width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)

                      ),


                      contentPadding: EdgeInsets.only(
                          top: 18, bottom: 18, right: 20, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: LanguageProvider.getTexts('Departureendtime').toString(),

                    ),
                    readOnly: true,  //set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if(pickedTime != null ){
                        print(pickedTime.format(context));   //output 10:51 PM
                        DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime = DateFormat('HH:mm').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                         setState(() {
                           timeout.text = formattedTime; //set the value of text field.
                           calculatelongtimee();
                        });
                      }else{
                        print("Time is not selected");
                      }
                    },
                  )
              )
          ),

          Align(
              child: Container(

                  margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  //  alignment: Alignment.center,
                  child: TextField(

                    controller: longtimecontroler,
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.looks_one_sharp),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hexToColor("#415440"), width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)

                      ),


                      contentPadding: EdgeInsets.only(
                          top: 18, bottom: 18, right: 20, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: LanguageProvider.getTexts('Departuretime').toString(),

                    ),
                  )
              )),

          Align(
              child: Container(
                  margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  //  alignment: Alignment.center,

                  child: TextField(

                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.message_outlined),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hexToColor("#415440"), width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 0.0),
                          borderRadius: BorderRadius.circular(10.0)

                      ),


                      contentPadding: EdgeInsets.only(
                          top: 70, bottom: 18, right: 20, left: 20),
                      fillColor: Colors.white,
                      filled: true,

                      hintText: LanguageProvider.getTexts('notes').toString(),
                    ),

                  )




              )),


          Container(
              margin: const EdgeInsets.only(left: 50.0,right: 50.0,top: 50.0,bottom: 20.0),
              color: Colors.transparent,
              //      color: Colors.deepPurple,
              width: 300,
              height:50,
              child: ElevatedButton(


                onPressed: () {  },
                child: Text(LanguageProvider.getTexts('Send').toString()),
              )
          ),

])

             ))]))));



  }
  Color hexToColor(String code) {

    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

  }

   getdate(){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
     date = formatter.format(now);
  }
 calculatelongtimee() {
   var format = DateFormat("HH:mm");
   var one = format.parse(timeinput.text);
   var two = format.parse(timeout.text);
   var x=two.difference(one).inMilliseconds;
   var dt = DateTime.fromMillisecondsSinceEpoch(x);
   var splited = timeinput.text.split(':');
   int hour1 = int.parse(splited[0]);
   int minute1 = int.parse(splited[1]);

   var splited2 = timeout.text.split(':');
   int hour2 = int.parse(splited2[0]);
   int minute2 = int.parse(splited2[1]);
   var hours;  var minutes;
if(hour2>hour1)
    hours = (hour2-hour1).toString() ;
else
   hours = (hour1-hour2).toString() ;
   if(minute2>minute1)
    minutes = (minute2-minute1).toString() ;
   else
     minutes = (minute1-minute2).toString() ;

var d=hours+":"+minutes ;
   var d24 = DateFormat('HH:mm').format(dt);
   longtimecontroler.text = d ;
 }
}