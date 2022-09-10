
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Diagnostique extends StatefulWidget {
  const Diagnostique({Key? key}) : super(key: key);

  @override
  State<Diagnostique> createState() => _DiagnostiqueState();
}

class _DiagnostiqueState extends State<Diagnostique> with WidgetsBindingObserver {

  late CameraController _controller;
  Future<void>? _initController;
  var isCameraReady = false;
  late XFile imageFile;

  Widget cameraWidget(context){
        var camera = _controller.value;
        final size = MediaQuery.of(context).size;
        var scale = size.aspectRatio * camera.aspectRatio;
        if (scale >  1 ) scale = 1 / scale;
        return Transform.scale(scale: scale,child: Center(child: CameraPreview(_controller),));
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
    if (state == AppLifecycleState.resumed){
      _initController = _controller != null ? _controller.initialize() : null;
      if(!mounted)
      return;
      setState(() {
        isCameraReady = true;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initController,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Stack(children: [
              cameraWidget(context),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Color(0xAA333639),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () => captureImage(context), 
                        iconSize: 40,
                        icon: Icon(Icons.camera_alt, color: Colors.white,))
                    ],
                  ),
                ),
              )
            ],);
          }
          else return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
  
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final fistCamera = cameras.first;
    _controller = CameraController(fistCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if(!mounted)
      return;
    setState(() {
      isCameraReady = true;
    });
  }
  
  captureImage(BuildContext context) {
    _controller.takePicture().then(((file) {
      setState(() {
        imageFile = file;
      });

      if(mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context) => 
          DisplayPictureScreen(
            image:imageFile
          )
        ));
      }
    }));
  }
}

class DisplayPictureScreen extends StatelessWidget{
  final XFile image;

  DisplayPictureScreen ({Key? key, required this.image}) : super(key: key);
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.file(File(image.path), fit: BoxFit.fill,),
      ),
    );
  }
}