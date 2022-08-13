

import 'package:flutter/material.dart';
import 'package:flutter_codigo_weather/ui/widgets/general_widgets.dart';

class ItemForecastWidget extends StatelessWidget {
  const ItemForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        children: [
          Text(
            "05:00 AM",
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          divider12,
          Image.asset(
            'assets/images/clear-sky.png',
            color: Colors.white,
            height: 46.0,
          ),
          divider12,
          Text(
            "29°",
            style: TextStyle(
                color: Colors.white.withOpacity(1),
                fontWeight: FontWeight.w600,
                fontSize: 22.0
            ),
          ),
        ],
      ),
    );
  }
}
