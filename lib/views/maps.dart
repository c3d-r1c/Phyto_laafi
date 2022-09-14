import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSCreen extends StatefulWidget {
  const MapsSCreen({Key? key}) : super(key: key);

  @override
  State<MapsSCreen> createState() => _MapsSCreenState();
}

class _MapsSCreenState extends State<MapsSCreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(12.312721, -1.5284208),
    zoom: 15,
  );

  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: ((controller) => _googleMapController = controller),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: (() => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        )),
        child: const Icon(Icons.center_focus_strong)

        ),
    );
  }
}