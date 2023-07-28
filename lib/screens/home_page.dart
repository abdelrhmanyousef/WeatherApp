import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Models/providerModel.dart';
import 'package:weather/Models/weather_model.dart';
import 'package:weather/weatherState/WeatherCubit.dart';
import 'package:weather/weatherState/weatherstates.dart';

import 'Search_page.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Weather_Model? weatherdata;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Search_page();
                  },
                ));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is WeatherSuccess) {
          weatherdata = BlocProvider.of<WeatherCubit>(context).weathermodel;
          return Container(
            color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  BlocProvider.of<WeatherCubit>(context).cityName!,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weatherdata!.date,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(weatherdata!.getImage()),
                    Text(weatherdata!.Temp.toString(),
                        style: TextStyle(
                          fontSize: 19,
                        )),
                    Column(
                      children: [
                        Text("Max: 12${weatherdata!.maxTemp.toInt()}",
                            style: TextStyle(
                              fontSize: 19,
                            )),
                        Text("Max: 12${weatherdata!.minTemp.toInt()}",
                            style: TextStyle(
                              fontSize: 19,
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(weatherdata!.condition,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          );
        } else if (state is WeatherFailuer) {
          return Center(
            child: Container(
              child: Text("SomeThing Wrong Please Try Again"),
            ),
          );
        } else {
          return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/3366845.jpg"),
                    alignment: Alignment.bottomCenter),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "There is no Weather 😪 start",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Searching Now 🔎",
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    )
                  ],
                ),
              ));
        }
      }),
    );
  }
}
