import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LanguageProvider.dart';
import 'models/HttpService.dart';
import 'models/Post.dart';

class WorkStatePage extends StatelessWidget {

  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( LanguageProvider.getTexts('workingstate').toString()),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Post post) => ListTile(

                        leading : Container(
    margin: const EdgeInsets.only(left:5.0,right:5.0,top: 20.0,bottom: 0.0),
width: 300,
                  height: 35,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width:50,
                        height: 50,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            post.count.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 17),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              post.description,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),
                            )),)
                    ],
                  )
              ),
                 /* title: Text(post.description,textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(post.count.toString()
                    ,textAlign: TextAlign.center,
                      style: TextStyle(

                        color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  ),
*/


                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }}

  /*late BuildContext mcontext;
  TextEditingController dateCtl = TextEditingController();
  DateTime currentDate = DateTime.now();
  TextEditingController date = TextEditingController();
  var data;
//  var arr = new List.filled(5, null, growable: false);



  Future<WorkState> getUser() async {
    Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/EmployeeInfo/GetEmployeeWorkInfo/9");


    http.Response response = await http.get(apiUrl);

    var jsonResponse = jsonDecode(response.body);

    // var parsedJson = json.decode(jsonResponse);
    data = WorkState.fromJson(jsonResponse);
    return data;
  }



  *//*Future<List<WorkState>?> getUser() async {
    Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/EmployeeInfo/GetEmployeePersonalInfo/"+Globalvireable.id);
    http.Response response = await http.get(apiUrl);
    var jsonResponse = jsonDecode(response.body);
    List<WorkState>? tags = jsonResponse != null ? List.from(jsonResponse) : null;
    return tags;
  }*//*


  goBackToPreviousScreen(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    Future<void> _selectDate(BuildContext context) async {
       DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: currentDate,
          firstDate: DateTime(2018),
          lastDate: DateTime(2050));
      if (pickedDate != null && pickedDate != currentDate)
        // setState(() {
        {currentDate = pickedDate;
date.text=currentDate.toString().substring(0,10);
        }
      // });


    }
    mcontext=context;
    if (LanguageProvider.getTexts("language") != "language"){
      return Scaffold(



      appBar: AppBar(
          centerTitle: true,
          titleSpacing:0.0,
          title: Text(
              LanguageProvider.getTexts('workingstate').toString(),
              textDirection: TextDirection.ltr)
      ),
        body: SingleChildScrollView(
          child: FutureBuilder(
         *//* future: getUser(),
    builder: (context, snapshot) {
      List posts = snapshot.data as List;
    if (snapshot.hasData) {*//*


              future: httpService.getPosts(),
              builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                if (snapshot.hasData) {
                  List<Post>? posts = snapshot.data;

    var data = snapshot.data;

//backgroundColor: Colors.white,
    return Container(

    child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 5.0,bottom: 0.0),


            child: SingleChildScrollView(
            child: Column(children: [

              Align(

                  alignment: Alignment.topLeft,

                  child: TextFormField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: dateCtl,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                  //    icon: Icons.date_range,
                      labelText: currentDate.toString().substring(0,10),
                      hintText: "",),
                    onTap: () async{
                      DateTime date = DateTime(2008);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(2008),
                          lastDate: DateTime(2050)))!;

                      dateCtl.text = date.toString().substring(0,10);},


                  )
                *//*RaisedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    color: Theme.of(context).accentColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                          Text(
                            currentDate.toString().substring(0,10),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),*//*
                  ),

                *//*RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(Icons.date_range),
                          ),


                        ),
                        TextSpan(text: currentDate.toString().substring(0,10),   style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black,),
                          recognizer: new TapGestureRecognizer()..onTap = () =>


                              _selectDate(context)

                          *//**//*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("رقم المستخدم او رمز المرور خطأ"),
                              )
                             *//**//*


                         ),
                      ],
                    ),
                  )*//*


             Container(
                 margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 0.0),

                 child: Row(
                children: <Widget>[
                Container(
                  width:60,
                  height: 60,
                  color: Colors.pink,
                  child: Center(
                    child: Text(
                     " posts.",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                  ),),),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                      child: Text(
                        "الدوام الـكامل",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                      )),)
                ],
              )
            ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "التاخير الصباحي",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "المغادرة باكرا",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

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
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "عدم ختم بداية الدوام",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "عدم ختم نهاية الدوام",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.amberAccent,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "غياب بدون عذر",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

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
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "عدد ايام الاجازات",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),

              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "نسبة ايام العمل الفعلية",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),


              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.lightGreenAccent,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "ايام العمل الفعلية",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),



              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

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
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "رصيد الاجازات السنوية",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),




              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "رصيد الاجازات المرضية",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),




              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "المهمات الرسمية",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),


              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                  child: Row(
                    children: <Widget>[
                      Container(
                        width:60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "15",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "الدورات التدريبية",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                            )),)
                    ],
                  )
              ),





*//*
              Container(
                margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 20.0,bottom: 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('تسجيل الدخول'),
                  )
              ),


*//*




            *//*  Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 0.0),
                child: Text(getSystemTime(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
              ),*//*
*//*
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
        )),*//*
*//*
              Container( child: Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

                child: Material(
                  child: GestureDetector(
                    onTap: () {

                      // makePostRequest();

                      *//**//*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("تم تسجيل الدخول بنجاح"),
                  ),);*//**//*
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child:Image.network('https://image.flaticon.com/icons/png/512/25/25936.png',
                            width: 200.0, height: 200.0),

                      ),
                    ),
                  ),
                ),),),*//*



*//*Container(
  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),
       child: FlatButton(

        padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("تم تسجيل الدخول بنجاح"),
          ));


        }, child: Text(""),

      ),),*//*

            ],),),

          ),),);

      } else {
      return Center(child: CircularProgressIndicator());
      }
    }),

        )

    );}else{



      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            titleSpacing:0.0,
            title: Text(
                LanguageProvider.getTexts('workingstate').toString(),
                textDirection: TextDirection.rtl)
        ),
        body: SingleChildScrollView(

          child: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 5.0,bottom: 0.0),


              child: SingleChildScrollView(
                child: Column(children: [

                  Align(

                      alignment: Alignment.topRight,

                      child: TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        controller: dateCtl,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          //    icon: Icons.date_range,
                          labelText: currentDate.toString().substring(0,10),
                          hintText: "",),
                        onTap: () async{
                          DateTime date = DateTime(2008);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate:DateTime.now(),
                              firstDate:DateTime(2008),
                              lastDate: DateTime(2050)))!;

                          dateCtl.text = date.toString().substring(0,10);},


                      )
                    *//*RaisedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    color: Theme.of(context).accentColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                          Text(
                            currentDate.toString().substring(0,10),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),*//*
                  ),

                  *//*RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(Icons.date_range),
                          ),


                        ),
                        TextSpan(text: currentDate.toString().substring(0,10),   style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black,),
                          recognizer: new TapGestureRecognizer()..onTap = () =>


                              _selectDate(context)

                          *//**//*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("رقم المستخدم او رمز المرور خطأ"),
                              )
                             *//**//*


                         ),
                      ],
                    ),
                  )*//*


                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(

                                alignment: Alignment.center,
                                child: Text(
                                  "الدوام الـكامل",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )

                            )

                            ,),

                          Container(

                            width:60,
                            height: 60,
                            color: Colors.pink,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),


                          ),

                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "التاخير الصباحي",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),)
                          ,
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "المغادرة باكرا",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),) ,
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.amber,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "عدم ختم بداية الدوام",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
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
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "عدم ختم نهاية الدوام",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "غياب بدون عذر",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.amberAccent,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "عدد ايام الاجازات",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),) ,
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
                        ],
                      )
                  ),

                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "نسبة ايام العمل الفعلية",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),) ,
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),


                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "ايام العمل الفعلية",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),) ,
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.lightGreenAccent,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),



                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "رصيد الاجازات السنوية",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
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
                        ],
                      )
                  ),




                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "رصيد الاجازات المرضية",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),




                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "المهمات الرسمية",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.amber,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),


                  Container(
                      margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0.0),

                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "الدورات التدريبية",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                                )),),
                          Container(
                            width:60,
                            height: 60,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "15",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 19),
                              ),),),
                        ],
                      )
                  ),





*//*
              Container(
                margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 20.0,bottom: 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('تسجيل الدخول'),
                  )
              ),


*//*




                  *//*  Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 0.0),
                child: Text(getSystemTime(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
              ),*//*
*//*
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
        )),*//*
*//*
              Container( child: Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

                child: Material(
                  child: GestureDetector(
                    onTap: () {

                      // makePostRequest();

                      *//**//*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("تم تسجيل الدخول بنجاح"),
                  ),);*//**//*
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child:Image.network('https://image.flaticon.com/icons/png/512/25/25936.png',
                            width: 200.0, height: 200.0),

                      ),
                    ),
                  ),
                ),),),*//*



*//*Container(
  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),
       child: FlatButton(

        padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 40.0),

        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("تم تسجيل الدخول بنجاح"),
          ));


        }, child: Text(""),

      ),),*//*

                ],),),

            ),),),



      );


   *//* } else {
    return Center(child: CircularProgressIndicator());
    }
    }),

    )*//*

    }

  }

}
*/