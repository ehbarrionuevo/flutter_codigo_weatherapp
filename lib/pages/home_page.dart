import 'package:flutter/material.dart';
import 'package:flutter_codigo_weather/ui/general/colors.dart';
import 'package:flutter_codigo_weather/ui/widgets/general_widgets.dart';
import 'package:flutter_codigo_weather/ui/widgets/item_forecast_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                    "24",
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "°C",
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
                    "Arequipa,",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  divider3Width,
                  Text(
                    "PE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              divider30,
              TextField(
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
                  onPressed: () {},
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
                "Pronóstico del clima",
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
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 28.0),
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
    );
  }
}
