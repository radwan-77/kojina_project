import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kojina_project/provider/base_provider.dart';

class LocationProvider extends BaseProvider {
  Position? inpositon;
  late GoogleMapController googleMapController;
  Marker? currentlocation;
  bool btnPressed = true;

  void getlocation() async {
    setBusy(true);
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    inpositon = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    currentlocation = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(inpositon!.latitude, inpositon!.longitude),
    );
    setBusy(false);
    notifyListeners();

    if (kDebugMode) {
      print("LATLOC ${inpositon!.latitude} - LONGLOC ${inpositon!.longitude}");
    }
  }

  void updatelocation(newlocation) async {
    setBusy(true);
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: newlocation, zoom: 19)),
    );
    currentlocation = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: newlocation = LatLng(inpositon!.latitude, inpositon!.longitude),
    );
    // setState(() {
    //   widget.latiTude = newlocation.latitude;
    //   widget.longiTude = newlocation.longitude;
    // });
    setBusy(false);
    if (kDebugMode) {
      print("LATLOC ${inpositon!.latitude} - LONGLOC ${inpositon!.longitude}");
    }
  }
}
