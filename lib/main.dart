import 'package:flutter/material.dart';


void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstnum=0;
  int secondnum=0;
  String texttodisplay="";
  String res="";
  String operatortoperform="";
  void btnclicked(String btnvalue){
    if(btnvalue=="C"){
      texttodisplay="";
      firstnum=0;
      secondnum=0;
      res="";
    }
    else if(btnvalue=="+" || btnvalue=="-" || btnvalue=="X" || btnvalue=="/"){
       firstnum=int.parse(texttodisplay);
       res="";
       operatortoperform =btnvalue;
    }
    else if(btnvalue== "=" ){
      secondnum=int.parse(texttodisplay);
      if(operatortoperform=="+"){
        res =(firstnum + secondnum).toString();
      }
      if(operatortoperform=="-"){
        res =(firstnum - secondnum).toString();
      }
      if(operatortoperform=="X"){
        res =(firstnum * secondnum).toString();
      }
      if(operatortoperform=="/"){
        res =(firstnum / secondnum).toString();
      }
    }
    else{
      res= int.parse(texttodisplay + btnvalue).toString();
    }
    setState(() {
      texttodisplay= res;
    });
  }


  Widget custombutton(String btnvalue){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnvalue) ,
        child: Text(
            '$btnvalue',
            style: TextStyle(
              fontSize: 25.0
              ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CALCULATOR',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ),
            Row(
              children: <Widget>[
                 custombutton("9"),
                 custombutton("8"),
                 custombutton("7"),
                 custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
