import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    String workname="mobile developer";
    String empname="basel alzaben";
    String Administration="الادارة العامة";
    String department="الدعم الفــني";


    String Qualification="بكالوريوس علم الحاسوب";
    String empstate="دوام";
    String nworkyear="0";
    TextEditingController namecontroler = TextEditingController();
    namecontroler.text="basel alzaben";

    return Scaffold(
backgroundColor: Colors.white,
      body: Container(



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
                empname,
                style: TextStyle(

                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )

          ),



          Container(
            margin: const EdgeInsets.only(top: 5.0),

            child: Text(
              workname,
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

                Qualification,
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

                empstate,
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
            margin: const EdgeInsets.only(top: 0.0,right: 10.0,left: 5.0),

            child: Align(
              alignment: Alignment.topRight,
              child: Text(

                nworkyear,
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
      ),
    );
  }
}