import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../LanguageProvider.dart';
import '../homePage.dart';
import 'dart:io' as io;
class body_vacation extends StatefulWidget {
  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),);
  }
  @override
  _body_vacation createState() => _body_vacation();
}
goBackToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}


/*Widget showImage() {
  return FutureBuilder<File>(
    future: imageFile,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null) {
        dynamic file = File(snapshot.data[0]);
        return Image.file(
          file,
          width: 300,
          height: 300,
        );
      } else if (snapshot.error != null) {
        return const Text(
          'Error Picking Image',
          textAlign: TextAlign.center,
        );
      } else {
        return const Text(
          'No Image Selected',
          textAlign: TextAlign.center,
        );
      }
    },
  );
}*/
class _body_vacation extends State<body_vacation> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  TextEditingController longtimecontroler = TextEditingController();
  String date="";
  String timelong="";

  List<Image> imgs = [];

  late Future<io.File> profileImg;
  @override
  Widget build(BuildContext context) {
    goBackToPreviousScreen(BuildContext context) {
      Navigator.pop(context);
    }

    getdate();

    return Scaffold(
        appBar: AppBar(title: Text(
          LanguageProvider.getTexts('vacationrequest').toString(),
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
                                                hintText: LanguageProvider.getTexts('vactiontype').toString(),

                                              ),
                                            )




                                        )),



                                    Align(

                                        child: Container(
                                            margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                                            //  alignment: Alignment.center,
                                            child: TextField(

                                              decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.format_align_justify),
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
                                                hintText: LanguageProvider.getTexts('emmployees').toString(),

                                              ),
                                            )




                                        )),




                                    Align(
                                        child: Container(

                                            margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                                            child: TextFormField(
                                              readOnly: true,
                                              controller: timeinput,
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
                                                hintText: LanguageProvider.getTexts('datestartvaction').toString(),

                                              ),
                                              onTap: () async {
                                                await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2015),
                                                  lastDate: DateTime(2025),
                                                ).then((selectedDate) {
                                                  if (selectedDate != null) {

                                                    timeinput.text =
                                                        DateFormat('yyyy-MM-dd').format(selectedDate);
                                                  }
                                                });

                                                calculatelongtimee();

                                              },
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter date.';
                                                }
                                                return null;
                                              },
                                            ))),

                                    Align(
                                        child: Container(

                                            margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: timeout,
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
                                        hintText: LanguageProvider.getTexts('dateendvaction').toString(),

                                      ),
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2015),
                                          lastDate: DateTime(2025),
                                        ).then((selectedDate) {
                                          if (selectedDate != null) {

                                            timeout.text =
                                            DateFormat('yyyy-MM-dd').format(selectedDate);
                                          }
                                        });

                                        calculatelongtimee();
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter date.';
                                        }
                                        return null;
                                      },
                                    ))),

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
                                                hintText: LanguageProvider.getTexts('vactioncount').toString(),

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

                                                hintText: LanguageProvider.getTexts('phoneanddetails').toString(),
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

                                    Align(
                                      child: Container(

                                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                                         alignment: Alignment.center,

                                        child: Column(

                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            ElevatedButton(

                                              child: Text(LanguageProvider.getTexts('selectimage').toString()),
                                              onPressed:
                                                  () async {
                                                var imgFile = await ImagePicker.pickImage(
                                                source: ImageSource.gallery

                                                );
                                                setState((){
                                                  // /100dp  imgs.add(Image.file(imgFile));
                                                  imgs.add(Image.file(imgFile));
                                                });
                                              },
                                            ),
                                            Container(
                                                height: 100,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: imgs.length,


                                                  itemBuilder: (context, i) =>
                                                      Column(
                                                          children: [

                                                            Container(
                                                              width: 100,
                                                              height: 100,
                                                              child: imgs[i],
                                                            )
                                                            //  Divider()
                                                          ]
                                                      ),
                                                )),

                                          ],
                                        ),
                                      ),

                                    ),





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

                          )),









                    ]))));



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


    DateTime from = DateTime.parse(timeinput.text);
    DateTime to = DateTime.parse(timeout.text);
    var differenceInDays = to.difference(from).inDays.toString();
if(differenceInDays.contains('-'))
  differenceInDays='0';
    longtimecontroler.text = differenceInDays ;
  }


  }
