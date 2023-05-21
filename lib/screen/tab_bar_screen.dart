import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projet/screen/profil_screen.dart';
import 'package:flutter_mini_projet/screen/projet_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../meteo/meteoModel.dart';
import 'exp_screen.dart';
import 'formation_screen.dart';

var dayinfo = DateTime.now();
var dateFormat = DateFormat('EEE, d MMM, yyyy').format(dayinfo);

bool isLoading = true;

class TabBarScreen extends StatefulWidget {
  Function switchTheme;

  TabBarScreen(this.switchTheme);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  var _indexPages = 0;
  List<Widget> pages = [
    ProfilScreen(),
    ExpScreen(),
    FormationScreen(),
    ProjetScreen(),
  ];
  double latitude = 0.0;
  double longitude = 0.0;
  Meteo? data;
  String cityName = '';
  var meteoData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getMeteoData(latitude, longitude);
    print("latitude");
    print(latitude);
    print("longitude");
    print(longitude);
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, handle accordingly.
      return;
    }

    if (permission == LocationPermission.denied) {
      // Location permissions are denied, ask for permission.
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Permissions are not granted, handle accordingly.
        return;
      }
    }

    // Location permissions are granted. Proceed to get the location.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
    data = await getData(latitude, longitude);
    print(longitude);
    setState(() {
      cityName = data?.cityName;
      print(cityName);
    });
  }

  Future<Meteo> getData(double latitude, double longitude) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=13cd770b97bb42c6a17121443232503&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);

    return Meteo.fromJson(body);
  }

  void getMeteoData(latitude, longitude) {
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?lat=${latitude}&lon=${longitude}&appid=541a147950d6e070e2fac5caef476b2c";

    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(meteoData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon CV'),
        actions: <Widget>[
          if (meteoData == null)
            Center(
              child: CircularProgressIndicator(),
            )
          else if (meteoData['list'] == null)
            Center(
              child: Text('No data available'),
            )
          else
            Row(
              children: [
                Text(
                  "${cityName} ",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Hubbali',
                    color: Colors.white,
                  ),
                ),
                Text(
                  "| ${(meteoData['list'][0]['main']['temp'] - 273.15).round()} °C",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Hubbali',
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/${meteoData['list'][0]['weather'][0]['main'].toString().toLowerCase()}.png",
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          IconButton(
            icon: Icon(Icons.format_color_fill),
            onPressed: () {
              widget.switchTheme();
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).backgroundColor,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.work_history,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.school,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.phonelink,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _indexPages = index;
          });
        },
      ),
      body: pages[_indexPages],
    );
  }
}
