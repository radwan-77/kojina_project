import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kojina_project/provider/base_provider.dart';

class LocationProvider extends BaseProvider {
  Position? inpositon;
  late GoogleMapController _googleMapController;
  Marker? _currentlocation;
  bool btnPressed = true;

  void getlocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    setBusy(false);
    inpositon = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    _currentlocation = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(inpositon!.latitude, inpositon!.longitude),
    );
    setBusy(true);
    // Set position

    if (kDebugMode) {
      print("LATLOC ${inpositon!.latitude} - LONGLOC ${inpositon!.longitude}");
    }
  }
}
