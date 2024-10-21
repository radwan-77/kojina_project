import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Position? inpositon;
  late GoogleMapController _googleMapController;
  Marker? _currentlocation;

  void getlocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    
    inpositon = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      _currentlocation = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Origin'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(inpositon!.latitude, inpositon!.longitude),

        
        
        // Set position
      );
      
    });

    if (kDebugMode) {
      print("LATLOC ${inpositon!.latitude} - LONGLOC ${inpositon!.longitude}");
    }
  }

  @override
  void initState() {
    super.initState();
    getlocation();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" اختر الموقع الخاص بك"),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          inpositon == null
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  height: getsize(context).height * 0.8,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target:
                            LatLng(inpositon!.latitude, inpositon!.longitude),
                        zoom: 5),
                    onMapCreated: (controller) =>
                        _googleMapController = controller,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    markers: {
                      if (_currentlocation != null) _currentlocation!,
                    },
                  ),
                ),
          Container(
            height: getsize(context).height * 0.1,
            alignment: Alignment.center,
            // height: double.minPositive,
            color: mainColor,
            width: getsize(context).width,
            child: ElevatedButton(
              child: const Text("تحديد الموقع"),
              onPressed: () {
                _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target:
                            LatLng(inpositon!.latitude, inpositon!.longitude),
                        zoom: 19),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}







// Scaffold(
//       body: inpositon == null
//           ? const Center(child: CircularProgressIndicator())
//           : GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(inpositon!.latitude, inpositon!.longitude),
//                   zoom: 5),
//               onMapCreated: (controller) => _googleMapController = controller,
//               myLocationButtonEnabled: false,
//               zoomControlsEnabled: false,
//               markers: {
//                 if (_currentlocation != null) _currentlocation!,
//               },
//             ),
            
      
//     );
