import 'package:flutter/material.dart';
import 'package:weather_assignm_flutter/controller/weather_controller.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: getdata(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60)),
                          child: Image.asset(
                            'assets/weatherhome-image.jpg',
                            fit: BoxFit.fill,
                            height: 560,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Enter City name',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder()),
                                    controller: city,
                                    onSubmitted: (value) {
                                      setState(() {
                                        getdata();
                                      });
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'country : ${snapshot.data.sys.country}',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 30),
                                  child: Text(
                                    '${snapshot.data.name}',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '${snapshot.data.main.temp}°C',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Text(
                                  '${snapshot.data.weather[0].main}',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.09,
                                      color: Color.fromARGB(255, 211, 208, 208),
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'temp_min',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'feels_like',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'humidity',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data.main.tempMin}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${snapshot.data.main.feelsLike}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${snapshot.data.main.humidity}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'temp_max',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'pressure',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'visibility',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data.main.tempMax}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${snapshot.data.main.pressure}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${snapshot.data.visibility}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'More Information',
                            style: TextStyle(
                                color: Color.fromARGB(255, 211, 208, 208),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 228,
                                  width: 228,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'weather',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 10),
                                        child: Text(
                                          'id: ${snapshot.data.id}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'icon: ${snapshot.data.weather[0].icon}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          'main: ${snapshot.data.weather[0].main}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'descrip: ${snapshot.data.weather[0].description}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  height: 228,
                                  width: 228,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'sys',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 10),
                                        child: Text(
                                          'type: ${snapshot.data.sys.type}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'id: ${snapshot.data.sys.id}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'sunrise: ${snapshot.data.sys.sunrise}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'sunset: ${snapshot.data.sys.sunset}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  height: 228,
                                  width: 228,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Wind',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 10),
                                        child: Text(
                                          'deg: ${snapshot.data.wind.deg}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'speed: ${snapshot.data.wind.speed}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  height: 228,
                                  width: 228,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'coord',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 10),
                                        child: Text(
                                          'lon: ${snapshot.data.coord.lon}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'lat: ${snapshot.data.coord.lat}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  height: 228,
                                  width: 228,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.grey, width: 2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'other',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 10),
                                        child: Text(
                                          'cod: ${snapshot.data.cod}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'clouds_all: ${snapshot.data.clouds.all}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          'id: ${snapshot.data.id}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'dt: ${snapshot.data.dt}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'timezone: ${snapshot.data.timezone}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.hasError}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
