import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather/models/api_response_model.dart';
import 'package:weather/models/weather_response_model.dart';
import 'package:weather/pages/main_page.dart';
import 'package:weather/servises/http_service.dart';
import 'package:weather/servises/log_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  ApiWeatherModel? result;

  getResponseList() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await Network.GET(
          Network.API_WEATHER_PROGNOZ, Network.paramsWeatherKey());
      var result = Network.parseWeatherList(response!);
      print(result);
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(result?.location?.name ?? ""),
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/img.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          getResponseList();
                        },
                        icon: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(18),
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                              border: Border.all(color: Colors.green)),
                          child: Text(
                            "TOSKENT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            backgroundColor: Colors.black.withOpacity(0.8),
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Container(
                                height: 700,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Select the region",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "TOSHKENT",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "NAMANGAN",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "ANDIJON",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "FARGONA",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "SAMARQAND",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "BUXORA",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "JIZZAX",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "NAVOIY",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "XORAZIM",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "SURXONDARYO",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "QASHQADARYO",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(left: 13),
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.green),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //  margin: EdgeInsets.only(top: 3),
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(),
                                                  child: Image.asset(
                                                    "assets/images/img_log.png",
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 9),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "SIRDARYO",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                              border: Border.all(color: Colors.green)),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.green,
                            size: 38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 130),
                  Container(
                    child: Text(
                      "WEATHER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 420,
              decoration: BoxDecoration(
                //color:Colors.green,
                border: Border.all(color: Colors.green),

                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/img_tep.png",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        // width: 25,
                        // height: 20,

                        child: Text(
                          "4.2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 25,
                        height: 38,
                        child: Image.asset(
                          "assets/images/img_ger.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/img_cloudy.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        // width: 25,
                        // height: 20,

                        child: Text(
                          "4.2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 25,
                        height: 38,
                        child: Image.asset(
                          "assets/images/img_ger.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          top: 15,
                        ),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/img_eye.png",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        // width: 25,
                        // height: 20,

                        child: Text(
                          "4.2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 25,
                        height: 38,
                        child: Image.asset(
                          "assets/images/img_ger.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 1,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 1,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 1,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Teprature",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          )),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "percipition",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "district",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 1,
                    color: Colors.green,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/img_wind.png",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        // width: 25,
                        // height: 20,

                        child: Text(
                          "4.2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 25,
                        height: 38,
                        child: Image.asset(
                          "assets/images/img_ger.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/img_rain.png",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        // width: 25,
                        // height: 20,

                        child: Text(
                          "4.2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 25,
                        height: 38,
                        child: Image.asset(
                          "assets/images/img_ger.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          top: 15,
                        ),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/img_compis.png",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        // width: 25,
                        // height: 20,

                        child: Text(
                          "4.2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 25,
                        height: 38,
                        child: Image.asset(
                          "assets/images/img_ger.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 1,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 1,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 1,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "windly",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          )),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "humendly",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "peressure",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_snow.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_cloudy.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_cloudy_snow.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_sunny.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_rainy.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_snow.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_cloudy.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_cloudy_snow.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_sunny.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 3),
                    height: 25,
                    width: 25,

                    child: Image.asset(
                      "assets/images/img_rainy.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "2024-12-08  -15.0" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 3,
                    width: 65,
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "- 5.9" + "°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ])),
        ));
  }
}
