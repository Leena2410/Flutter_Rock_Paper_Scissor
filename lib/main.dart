// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

/* ******************* VARIABLES ******************* */
var appbar_bg_color = Color.fromARGB(255, 148, 148, 255);
var appbar_text_Color = Color.fromARGB(255, 82, 82, 152);
var page_bg_color = Color.fromARGB(255, 255, 255, 255);

var user_choise = "img/unidentified.png";
var my_choise = "img/unidentified.png";
var result = "VS";
var wins = 0; 
var losses = 0; 
var ties = 0;
/* ******************* VARIABLES ******************* */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homewidget(),
    );
  }
  Widget Homewidget(){
    return Scaffold(
      backgroundColor: page_bg_color,
      appBar: AppBar(
        backgroundColor: appbar_bg_color,
        title: Text(
          "Rock-Paper_Scisser",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: appbar_text_Color,
          ),
        ),
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Wins",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  Text("$wins",
                    style: TextStyle(
                      fontSize: 15,
                    ),)
                ],
              ),
              Column(
                children: [
                  Text("Ties",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  Text("$ties",
                    style: TextStyle(
                      fontSize: 15,
                    ),)
                ],
              ),
              Column(
                children: [
                  Text("Losses",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  Text("$losses",
                    style: TextStyle(
                      fontSize: 15,
                    ),)
                ],
              ),
            ],
          )
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: appbar_bg_color,
                width: 100,
                height: 120,
                child: Image.asset(user_choise, ),
              ),
              Container(
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: appbar_bg_color,
                  ),
                ),
              ),
              Container(
                color: appbar_bg_color,
                width: 100,
                height: 120,
                child: Image.asset(my_choise, ),
              ),
            ],
          ),
          Text("Choose one of:"),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            OutlinedButton.icon(
              // iconAlignment: IconAlignment.start,
              style: OutlinedButton.styleFrom(
                iconColor: appbar_bg_color,
                foregroundColor: appbar_bg_color, 
              ),
              onPressed: () {compare(1);},
              icon: Icon(Icons.landscape),
              label: Text("Rock"),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                iconColor: appbar_bg_color,
                foregroundColor: appbar_bg_color, 
              ),
              onPressed: () {compare(2);},
              icon: Icon(Icons.article),
              label: Text("Paper"),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                iconColor: appbar_bg_color,
                foregroundColor: appbar_bg_color, 
              ),
              onPressed: () {compare(3);},
              icon: Icon(Icons.cut),
              label: Text("Scissers"),
            ),
          ],)
        ],
      ),
      )
    ;
  }
  void compare (int a){
    var b = math.Random().nextInt(3) + 1;
    dev.log("$b");
    if (a == 1) {
      setState(() {
        user_choise = "img/landscape.png";
      });
      if (b == 1) {
        setState(() {
          tie();
          my_choise = "img/landscape.png";
        });
      }else if(b == 2){
        setState(() {
          lose();
          my_choise = "img/article.png";
        });
      }else if(b == 3){
        setState(() {
          win();
          my_choise = "img/cut.png";
        });
      }
    }else if(a == 2){
      setState(() {
        user_choise = "img/article.png";
      });
      if (b == 1) {
        setState(() {
          win();
          my_choise = "img/landscape.png";
        });
      }else if(b == 2){
        setState(() {
          tie();
          my_choise = "img/article.png";
        });
      }else if(b == 3){
        setState(() {
          lose();
          my_choise = "img/cut.png";
        });
      }
    }else if(a == 3){
      setState(() {
        user_choise = "img/cut.png";
      });
      if (b == 1) {
        setState(() {
          lose();
          my_choise = "img/landscape.png";
        });
      }else if(b == 2){
        setState(() {
          win();
          my_choise = "img/article.png";
        });
      }else if(b == 3){
        setState(() {
          tie();
          my_choise = "img/cut.png";
        });
      }
    }
  }
  void lose(){
    setState(() {
      result = "Lose";
      page_bg_color = Colors.red.shade300;
      losses++;
    });
  }
  void win(){
    setState(() {
      result = "Win";
      page_bg_color= Colors.green.shade200;
      wins++;
    });
  }
  void tie(){
    setState(() {
      result = "Tie";
      page_bg_color= Colors.yellow.shade50;
      ties++; 
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Text("something something");
  }
  
}
