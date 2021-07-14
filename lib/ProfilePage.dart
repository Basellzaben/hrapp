import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'homePage.dart';
import 'models/Personalinfo.dart';
import 'sqlite/DatabaseHelper.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
var username;

 getuserdata()async{
  SharedPreferences prefer;

  prefer = await SharedPreferences.getInstance();

  var userid = prefer.getString('usenameinfo');

 return userid;
}


  // final String apiUrl = "http://10.0.1.63:8017/api/EmployeeInfo/GetEmployeePersonalInfo/9";

  Future<Personalinfo> getUser() async {
    Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/EmployeeInfo/GetEmployeePersonalInfo/"+Globalvireable.id);


    http.Response response = await http.get(apiUrl);
    
    var jsonResponse = jsonDecode(response.body);

   // var parsedJson = json.decode(jsonResponse);
    username = Personalinfo.fromJson(jsonResponse);
    return username;
  }

/*


  signIn_post(String id ,String password) async {
    Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/User/CheckUser");

    final json = {
      "User_ID": id,
      "User_Password": password
    };

    http.Response response = await http.post(apiUrl, body: json);


   // var jsonData = '{ "name" : "Dane", "alias" : "FilledStacks"  }';
    var jsonResponse = jsonDecode(response.body);

    var parsedJson = json.decode(json);
    var user = User.fromJson(parsedJson);
    print('${user.name} is ${user.alias}');


  }
*/




  @override
  Widget build(BuildContext context){




    String workname="مبرمج موبايل";
    String empname=username;
    String Administration="الادارة العامة";
    String department="الدعم الفــني";
    String Qualification="بكالوريوس علم الحاسوب";
    String empstate="دوام";
    String nworkyear="0";
    TextEditingController namecontroler = TextEditingController();
    namecontroler.text=username;


    return Scaffold(

        body: SingleChildScrollView(
        child: FutureBuilder<Personalinfo>(
        future: getUser(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    var data = snapshot.data;

//backgroundColor: Colors.white,
    return Container(

        child: SingleChildScrollView(
        child: Column(children: [

          Container(

            width: MediaQuery.of(context).size.height,
height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 65.0)),

              image: DecorationImage(
                image: AssetImage('assest/cover.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          child: Container(
            margin: const EdgeInsets.only(top: 33.0),

            width: 500,
            height: 200,
            child: ClipOval(
              child: Image.asset(
                'assest/profile.png',
              //  height: 200,
               // width: 200,
              ),
            ),),



          ),

          Container(
            margin: const EdgeInsets.only(top: 15.0),

            alignment: Alignment.center,

              child: Text(
                data!.EmployeeDisplayName,
                style: TextStyle(

                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )

          ),



          Container(
            margin: const EdgeInsets.only(top: 0.0),

            child: Text(
              data!.JobTitle,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
            )

            ,),


          Container(
              margin: const EdgeInsets.only(top: 40.0,right: 10.0,left: 5.0),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topRight,
              child: Text(
                "الادارة",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black45,

                    fontWeight: FontWeight.bold),
              ),)

          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0),

            child: Align(
              alignment: Alignment.topRight,
            child: Text(

              Administration,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),)

            ,),


          Container(
              margin: const EdgeInsets.only(top: 40.0,right: 10.0,left: 5.0),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "القسم",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,

                      fontWeight: FontWeight.bold),
                ),)

          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0),

            child: Align(
              alignment: Alignment.topRight,
              child: Text(

                department,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),)

            ,),



          Container(
              margin: const EdgeInsets.only(top: 40.0,right: 10.0,left: 5.0),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "المسؤول المباشر",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,

                      fontWeight: FontWeight.bold),
                ),)

          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0),


            child: Align(
              alignment: Alignment.topRight,
              child: Text(

               data.ManagerName,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),)

            ,),



          Container(
              margin: const EdgeInsets.only(top: 40.0,right: 10.0,left: 5.0),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  " المؤهل العلمي  ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,

                      fontWeight: FontWeight.bold),
                ),)

          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0),

            child: Align(
              alignment: Alignment.topRight,
              child: Text(

                data!.Education_Desc,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),)

            ,),



          Container(
              margin: const EdgeInsets.only(top: 40.0,right: 10.0,left: 5.0),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "حالة الموظف",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,

                      fontWeight: FontWeight.bold),
                ),)

          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0),

            child: Align(
              alignment: Alignment.topRight,
              child: Text(

                data!.AttStatus,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),)

            ,),



          Container(
              margin: const EdgeInsets.only(top: 40.0,right: 10.0,left: 5.0),
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "عدد سنوات الخبرة",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,

                      fontWeight: FontWeight.bold),
                ),)

          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0,bottom: 20.0),

            child: Align(
              alignment: Alignment.topRight,
              child: Text(

                data!.YearsOfExp,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),)
            ,),


/*          Container(
              margin: const EdgeInsets.only(left: 5.0,right: 5.0,top: 50.0,bottom: 0.0),

              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),

                    child: Text(
                      workname,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    )

                    ,)




                ],
              )
          ),*/

      /*        child: TextField(
            style: TextStyle(
                fontSize: 25.0,
                height: 0.0,
                color: Colors.black
            ),
            textAlign: TextAlign.center,
            enabled: false,
controller: namecontroler,
            decoration: InputDecoration(

            ),
          )*/


        ]),)



        /* add child content here */,
      );

    } else {
    return Center(child: CircularProgressIndicator());
    }
    }),

    ));
  }
}