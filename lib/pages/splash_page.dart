import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String id = "splash_page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  callNextPage() {
    Navigator.pushReplacementNamed(context, HomePage.id);
  }


  initTimer(){
    Timer(Duration(seconds: 2,),(){
      //print("Waited 2 second");
      callNextPage();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(193, 53, 132, 1),
                Color.fromRGBO(141, 58, 180, 1),
              ]),
        ),
        padding: EdgeInsets.all(50),
        //color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Text(
                "WEATHER",
                style: TextStyle(
                    fontSize: 35, fontFamily: "Billabong", color: Colors.white),
              ),
            ),
            Container(
              //color: Colors.grey,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      "Powered by Fecbook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
