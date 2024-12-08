import 'package:flutter/material.dart';
import 'package:weather/models/weather_response_model.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/servises/api.dart';
import 'package:weather/servises/http_service.dart';
import 'package:weather/servises/log_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // PageController? pageController;
  // int _currentIndex = 0;
  WeatherResponse? response;
  bool inPragress = false;
  String massage = "Search for the location get weather date";

  _getWeatherDate(String location) async {
    setState(() {
      inPragress = true;
    });
    try {
      response = await WeatherApi().getCurrentWeather(location);
    } catch (e) {
      setState(() {
        massage = "Failed to get weather";
        response = null;
      });
    } finally {
      setState(() {
        inPragress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        body: Container(
          //color: Colors.blue,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchWidget(),
              SizedBox(
                height: 25,
              ),
              if (inPragress)
                CircularProgressIndicator()
              else
                Expanded(
                    child: SingleChildScrollView(child: _buildWeatherWidget())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return SearchBar(
      hintText: "Search any location",
      onSubmitted: (value) {
        _getWeatherDate(value);
      },
    );
  }

  Widget _buildWeatherWidget() {
    if (response == null) {
      return Text(
        massage,
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Text(
                response?.location?.name ?? "",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    response?.location?.country ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                (response?.current?.tempC.toString() ?? "") + "°c",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                (response?.current?.condition?.toString() ?? ""),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
          Center(
            child: SizedBox(
                height: 200,
                child: Image.network(
                  // color: Colors,
                  "https:${response?.current?.condition?.icon}"
                      .replaceAll("64x64", "128x128"),
                  scale: 0.7,
                )),
          ),
          Card(
            elevation: 4,
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dadaAndTitleWidget("Humendliy",
                        response?.current?.humidity?.toString() ?? ""),
                    _dadaAndTitleWidget(
                        "Wind Speed",
                        "${response?.current?.windKph?.toString() ?? ""}" +
                            "Km/h"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dadaAndTitleWidget(
                        "Uv", response?.current?.uv?.toString() ?? ""),
                    _dadaAndTitleWidget("Percipitation",
                        "${response?.current?.precipMm?.toString() ?? ""}mm"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dadaAndTitleWidget("Location  time",
                        response?.location?.localtime?.split(" ").last ?? ""),
                    _dadaAndTitleWidget("Location Dade",
                        response?.location?.localtime?.split(" ").first ?? ""),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }
  }

  Widget _dadaAndTitleWidget(String title, String date) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
                fontSize: 27, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
