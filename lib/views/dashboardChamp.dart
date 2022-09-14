import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<DataTr> fetchDataTr() async {
  final response =
      // await http.get(Uri.parse('http://127.0.0.1:8000/api/donneestr/2/'));
      await http.get(Uri.parse('http://10.0.2.2:8000/api/donneestr/2/'));
      // await http.get(Uri.parse('https://53b7-197-239-76-109.eu.ngrok.io/api/donneestr/2/'),

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DataTr.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Datas');
  }
}

class DataTr {
  int id;
  double temp;
  double hamb;
  double hsol;
  double teau;
  double nitr;
  double phos;
  double pota;
  int capteur_id;

  DataTr({
    required this.id,
    required this.temp,
    required this.hamb,
    required this.hsol,
    required this.teau,
    required this.nitr,
    required this.phos,
    required this.pota,
    required this.capteur_id,
  });

  factory DataTr.fromJson(Map<String, dynamic> json) {
    return DataTr(
      id: json["id"],
      temp: json["temp"],
      hamb: json["hamb"],
      hsol: json["hsol"],
      teau: json["teau"],
      nitr: json["nitr"],
      phos: json["phos"],
      pota: json["pota"],
      capteur_id: json["capteur_id"],
    );
  }
}

class DashboardChamp extends StatefulWidget {
  const DashboardChamp({Key? key}) : super(key: key);

  @override
  State<DashboardChamp> createState() => _DashboardChampState();
}

class _DashboardChampState extends State<DashboardChamp> {
  late Future<DataTr> futureDataTr;

  @override
  void initState() {
    super.initState();
    futureDataTr = fetchDataTr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tableau de bord"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<DataTr>(
          future: futureDataTr,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    height: 400,
                    child: Expanded(
                      child: Stack(fit: StackFit.loose, children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/champ.png")),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.green.withOpacity(0.9),
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          children: [
                            Card(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                     Icons.device_thermostat_outlined, 
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.temp.toString()+"°C",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.cloudy_snowing,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Humidite",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.hamb.toString()+"g/m3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.invert_colors_on,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Humidite du sol",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    snapshot.data!.hsol.toString()+"% vol",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.energy_savings_leaf_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Teneur NPK",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.nitr.toString()+"-"+snapshot.data!.phos.toString()+"-"+snapshot.data!.pota.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  Row(
                    children: [Icon(Icons.settings), Text("Paramtres")],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 15, left: 15, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.4)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Etat :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  color: Colors.green,
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    child: Center(
                                        child: Text(
                                      "Activer",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Center(
                                          child: Text(
                                        "Desactiver",
                                      )),
                                    ),
                                    height: 30,
                                    width: 80,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
