import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:io' as io;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';


class Diagnostique extends StatefulWidget {
  const Diagnostique({Key? key}) : super(key: key);

  @override
  State<Diagnostique> createState() => _DiagnostiqueState();
}

Future<Diagnostic> addDiagnostic(File imgUrl) async {
  var request = http.MultipartRequest("POST", Uri.parse("https://ba3a-197-239-76-109.eu.ngrok.io/api/awsimage/"));
  request.fields["date"] =  DateTime.now().toString();
  var pic = await http.MultipartFile.fromPath("image_url", imgUrl.path);
  request.files.add(pic);
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  

  if (response.statusCode == 201) {
    var img_id = Diagnostic.fromJson(jsonDecode(responseString)).id;
    getPrediction(img_id);
    return Diagnostic.fromJson(jsonDecode(responseString));
  } else {
    throw Exception('Echec de diagnostique.');
  }
}

Future<Prediction> getPrediction(int id) async {
  final response = await http.post(
    Uri.parse('https://ba3a-197-239-76-109.eu.ngrok.io/api/prediction/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'img_id': id.toString(),
    }),
  );

  if (response.statusCode == 201) {
    var pred = Prediction.fromJson(jsonDecode(response.body)).predicts;
    print(pred);
    return Prediction.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Echec de prediction..');
  }
}

class Diagnostic {
  int id;
  String date;
  String image_url;

  Diagnostic({
    required this.id,
    required this.date,
    required this.image_url,
  });

  factory Diagnostic.fromJson(Map<String, dynamic> json) {
    return Diagnostic(
      id: json["id"],
      date: json["date"],
      image_url: json["image_url"],
    );
  }
}

class Prediction {
  int img_id;
  String predicts;
  double degre;

  Prediction({
    required this.img_id,
    required this.predicts,
    required this.degre,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      img_id: json["img_id"],
      predicts: json["predicts"],
      degre: json["degre"],
    );
  }
}

class _DiagnostiqueState extends State<Diagnostique>
    with WidgetsBindingObserver {
  late CameraController _controller;
  Future<void>? _initController;
  var isCameraReady = false;
  late XFile imageFile;

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale > 1) scale = 1 / scale;
    return Transform.scale(
        scale: scale,
        child: Center(
          child: CameraPreview(_controller),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initController = _controller != null ? _controller.initialize() : null;
      if (!mounted) return;
      setState(() {
        isCameraReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _initController,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    cameraWidget(context),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 30,
                              ),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 3.0, color: Colors.white)),
                              child: FittedBox(
                                child: InkWell(
                                  child: IconButton(
                                      onPressed: () => captureImage(context),
                                      iconSize: 40,
                                      icon: Icon(
                                        Icons.camera_outlined,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          child: Image(
                        width: 250,
                        image: AssetImage("assets/images/sc-2.gif"),
                      )),
                    )
                  ],
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ],
      ),
    );
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final fistCamera = cameras.first;
    _controller = CameraController(fistCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  captureImage(BuildContext context) {
    _controller.takePicture().then(((file) {
      setState(() {
        imageFile = file;
      });

      if (mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(image: imageFile)));
      }
    }));
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final XFile image;
  late Future<Diagnostic> futureDiagnostic = addDiagnostic(File(image.path));
  // int img_id = futureDiagnostic.toString();
  late Future<Prediction> futurePrediction = getPrediction(148);
  DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.file(
              File(image.path),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, left: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.transparent, width: 5),
              gradient: LinearGradient(colors: [
                Colors.green.withAlpha(99),
                Colors.lightGreen.withAlpha(95)
              ]),
            ),
            child: BackButton(color: Colors.white),
          ),
          
          Positioned(bottom: 0, left: 0, right: 0,
            child: FutureBuilder<Prediction>(
              future: futurePrediction,
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.90),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data!.predicts.toString(), style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                        SizedBox(height: 15,),                  
                        Row(
                              children: [
                                Expanded(child: Text("La tomate (Solanum lycopersicum L.) est une espèce de plantes herbacées du genre Solanum de la famille des Solanacées, originaire du Nord-Ouest de l'Amérique du Sud1, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu."))
                              ],
                            )
                      ],
                    ),
                    );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }
              )
            ,)

          // Positioned(bottom: 0, left: 0, right: 0,
          //   child: Container(
          //     padding: EdgeInsets.only(top: 25, left: 30, right: 30),
          //     height: 250,
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.90),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(30),
          //         topRight: Radius.circular(30)
          //       )
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("Nom de la Plante", style: TextStyle(
          //                   color: Colors.green,
          //                   fontSize: 22,
          //                   fontWeight: FontWeight.bold
          //                   ),
          //                 ),
          //               ],
          //             ),
                      
          //           ],
          //         ),
          //         SizedBox(height: 15,),                  
          //         Row(
          //               children: [
          //                 Expanded(child: Text("La tomate (Solanum lycopersicum L.) est une espèce de plantes herbacées du genre Solanum de la famille des Solanacées, originaire du Nord-Ouest de l'Amérique du Sud1, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu."))
          //               ],
          //             )
          //       ],
          //     ),
          //     )
          //   ,)
            
        ],
      ),
      floatingActionButton: SizedBox(
        width: 325,
        height: 50,
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,1),
                  blurRadius: 5,
                  color: Colors.lightGreen
                )
              ]
            ),
            child: Center(child: Text("Consulte le Book", style: TextStyle(color: Colors.white, fontSize: 20.0),)),
          )
        ),
      ),
    );
  }
}



// class DisplayPictureScreen extends StatelessWidget {
//   final XFile image;

//   DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: Image.file(
//               File(image.path),
//               fit: BoxFit.fill,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 40, left: 10),
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.transparent, width: 5),
//               gradient: LinearGradient(colors: [
//                 Colors.green.withAlpha(99),
//                 Colors.lightGreen.withAlpha(95)
//               ]),
//             ),
//             child: BackButton(color: Colors.white),
//           ),
          
//           Positioned(bottom: 0, left: 0, right: 0,
//             child: Container(
//               padding: EdgeInsets.only(top: 25, left: 30, right: 30),
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.90),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30)
//                 )
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Nom de la Plante", style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold
//                             ),
//                           ),
//                         ],
//                       ),
                      
//                     ],
//                   ),
//                   SizedBox(height: 15,),                  
//                   Row(
//                         children: [
//                           Expanded(child: Text("La tomate (Solanum lycopersicum L.) est une espèce de plantes herbacées du genre Solanum de la famille des Solanacées, originaire du Nord-Ouest de l'Amérique du Sud1, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu."))
//                         ],
//                       )
//                 ],
//               ),
//               )
//             ,)
            
//         ],
//       ),
//       floatingActionButton: SizedBox(
//         width: 325,
//         height: 50,
//         child: Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0,1),
//                   blurRadius: 5,
//                   color: Colors.lightGreen
//                 )
//               ]
//             ),
//             child: Center(child: Text("Consulte le Book", style: TextStyle(color: Colors.white, fontSize: 20.0),)),
//           )
//         ),
//       ),
//     );
//   }
// }
