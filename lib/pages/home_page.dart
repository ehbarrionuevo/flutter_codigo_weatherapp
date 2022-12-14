import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_weather/models/weather_model.dart';
import 'package:flutter_codigo_weather/services/api_service.dart';
import 'package:flutter_codigo_weather/ui/general/colors.dart';
import 'package:flutter_codigo_weather/ui/widgets/general_widgets.dart';
import 'package:flutter_codigo_weather/ui/widgets/item_forecast_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIService apiService = APIService();
  final TextEditingController _searchController = TextEditingController();
  String cityName = "";
  String country = "";
  double temp = 0;
  bool isLoading = false;

  @override
  initState(){
    super.initState();
    getDataGeolocator();
  }


  getData() {
    isLoading = true;
    setState(() {});
    apiService.getDataWeather(_searchController.text).then(
      (WeatherModel? value) {
        if (value != null) {
          cityName = value.name;
          country = value.sys.country;
          temp = value.main.temp - 273.15;
          isLoading = false;
          setState(() {});
        } else {
          isLoading = false;
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xffFA595D),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              content: Row(
                children: [
                  const Icon(
                    Icons.warning_amber,
                    color: Colors.white,
                  ),
                  divider3Width,
                  divider3Width,
                  const Text(
                    "Ciudad no encontrada, int??ntalo nuevamente.",
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  getDataGeolocator(){
    isLoading = true;
    setState((){});
    Geolocator.getCurrentPosition().then((value){
      apiService.getDataWeatherLocation(value).then((value){
        if (value != null) {
          cityName = value.name;
          country = value.sys.country;
          temp = value.main.temp - 273.15;
          isLoading = false;
          setState(() {});
        } else {
          isLoading = false;
          setState(() {});
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("WeatherApp"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getDataGeolocator();
            },
            icon: Icon(
              Icons.location_on,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/noche.png',
                    height: 80,
                  ),
                  divider12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        temp.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "??C",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  divider3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$cityName,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      divider3Width,
                      Text(
                        country,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  divider30,
                  TextField(
                    controller: _searchController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.06),
                      hintText: "Ingresa tu ciudad",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/building.svg',
                        color: Colors.white.withOpacity(0.4),
                        fit: BoxFit.scaleDown,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 15.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  divider20,
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        getData();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff5858E9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      icon: Icon(Icons.search),
                      label: Text(
                        "Buscar ahora",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  divider30,
                  Text(
                    "Pron??stico del clima",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  divider20,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        ItemForecastWidget(),
                        ItemForecastWidget(),
                        ItemForecastWidget(),
                        ItemForecastWidget(),
                        ItemForecastWidget(),
                        ItemForecastWidget(),
                      ],
                    ),
                  ),
                  divider40,
                  divider40,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 28.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    width: double.infinity,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "15 minutes ago",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            divider12,
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: -50,
                          right: 0,
                          child: Image.asset(
                            'assets/images/noche.png',
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                  divider40,
                  divider40,
                ],
              ),
            ),
          ),
          isLoading ? Container(
            color: kBrandPrimaryColor.withOpacity(0.94),
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Color(0xff5858E9),
                ),
              ),
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
