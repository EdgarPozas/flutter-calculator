import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator")
        ),
        body: Home(),

      )
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home>{

  var firstNumber="";
  var auxNumber="";
  var selectedOperation="";

  void tapPressed(text)
  {
    setState(() {
      if(text=="Delete"){
        if(this.auxNumber=="")
          return;
        this.auxNumber=this.auxNumber.substring(0,this.auxNumber.length-1);
        return;
      }
      if(text=="Clear all"){
        this.auxNumber="";
        return;
      }
      if(text=="="){

        var first=int.parse(this.firstNumber);
        var second=int.parse(this.auxNumber);

        if(this.selectedOperation=="+")
          this.auxNumber=(first+second).toString();
        if(this.selectedOperation=="-")
          this.auxNumber=(first-second).toString();
        if(this.selectedOperation=="X")
          this.auxNumber=(first*second).toString();
        if(this.selectedOperation=="/")
          this.auxNumber=(first/second).toString();

        this.selectedOperation="";
        this.firstNumber="";
        return;
      }
      if (text=="+" || text=="-" ||text=="X" ||text=="/"){
        this.selectedOperation=text;
        this.firstNumber=this.auxNumber;
        this.auxNumber="";
        return;
      }
      this.auxNumber+=text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputText=Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: auxNumber,
          enabled: false,
          labelStyle: TextStyle(
            fontSize: 30,
          )
        ),
      ),
    );

    final buttonKeyBoard = (text)=> Expanded(
        child:FittedBox(
          fit: BoxFit.fill,
          child:TextButton(
              onPressed: ()=> tapPressed(text),
              child: Text(text)
          )
        ),
    );

    final keyBoard=Column(
      children: <Widget>[
        Row(
          children: [
            buttonKeyBoard("+"),
            buttonKeyBoard("-"),
            buttonKeyBoard("X"),
            buttonKeyBoard("/"),
          ],
        ),
        Row(
          children: [
            buttonKeyBoard("7"),
            buttonKeyBoard("8"),
            buttonKeyBoard("9"),
          ],
        ),
        Row(
          children: [
            buttonKeyBoard("4"),
            buttonKeyBoard("5"),
            buttonKeyBoard("6"),
          ],
        ),
        Row(
          children: [
            buttonKeyBoard("1"),
            buttonKeyBoard("2"),
            buttonKeyBoard("3"),
          ],
        ),
        Row(
          children: [
            buttonKeyBoard("0"),
            buttonKeyBoard("Delete"),
            buttonKeyBoard("Clear all"),
          ],
        ),
        Row(
          children: [
            buttonKeyBoard("="),
          ],
        )
      ]
    );

    return Container(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            inputText,
            keyBoard
          ],
        )
      )
    );
  }
}