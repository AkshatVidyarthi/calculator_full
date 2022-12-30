import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  int first = 0, second = 0;
  String res = "", text = "";
  String opp = "";
  /*int numberOne = 0;
  int numberTwo = 0;
  String operator = "";
  String result = "";
  String displayText = "";*/

  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }

  Widget btnclk(String btn, {Color? buttonColor,Color? textColor}) {
    return (Expanded(
        child: MaterialButton(
            padding: EdgeInsets.all(32),
            color: buttonColor,
            elevation: 0,
            onPressed: () {
              btnClicked(btn);
            },
            child: Text(
              '$btn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: textColor),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Calculator'),
            backgroundColor: Colors.green,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    '$text',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                Row(children: [
                  btnclk("9"),
                  btnclk("8"),
                  btnclk("7"),
                  btnclk("+",buttonColor: Colors.green),
                ]),
                Row(children: [
                  btnclk("6"),
                  btnclk("5"),
                  btnclk("4"),
                  btnclk("-",buttonColor: Colors.green),
                ]),
                Row(children: [
                  btnclk("3"),
                  btnclk("2"),
                  btnclk("1"),
                  btnclk("x",buttonColor: Colors.green),
                ]),
                Row(children: [
                  btnclk("C",buttonColor: Colors.red),
                  btnclk("0"),
                  btnclk("=",buttonColor: Colors.teal),
                  btnclk("/",buttonColor: Colors.green),
                ]),
              ],
            ),
          )),
    );
  }
}
