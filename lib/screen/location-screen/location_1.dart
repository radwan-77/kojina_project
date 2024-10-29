import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/Location_provider.dart';
import 'package:kojina_project/screen/location-screen/location_2.dart';
import 'package:provider/provider.dart';

class LocationScreen1 extends StatefulWidget {
  double? latiTude;
  double? longiTude;
  LocationScreen1({
    super.key,
  });

  @override
  State<LocationScreen1> createState() => _LocationScreen1State();
}

class _LocationScreen1State extends State<LocationScreen1> {
  // void getlocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();

  //   inpositon = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   setState(() {
  //     _currentlocation = Marker(
  //       markerId: const MarkerId('origin'),
  //       infoWindow: const InfoWindow(title: 'Origin'),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //       position: LatLng(inpositon!.latitude, inpositon!.longitude),

  //       // Set position
  //     );
  //   });

  //   if (kDebugMode) {
  //     print("LATLOC ${inpositon!.latitude} - LONGLOC ${inpositon!.longitude}");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).getlocation();
  }

  @override
  void dispose() {
    Provider.of<LocationProvider>(context, listen: false)
        .googleMapController
        .dispose();

    dispose();
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
      body:
          Consumer<LocationProvider>(builder: (context, locationConsumrer, _) {
        return Column(
          children: [
            locationConsumrer.busy
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      Container(
                        height: getsize(context).height * 0.8,
                        child: GoogleMap(
                          // provider
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  locationConsumrer.inpositon!.latitude,
                                  locationConsumrer.inpositon!.longitude),
                              zoom: 14),
                          onMapCreated: (controller) => locationConsumrer
                              .googleMapController = controller,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          markers: {
                            if (locationConsumrer.currentlocation != null)
                              locationConsumrer.currentlocation!,
                          },

                          // update location marker

                          onLongPress: (newlocation) {
                            locationConsumrer.googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                  CameraPosition(target: newlocation, zoom: 19)),
                            );
                            locationConsumrer.currentlocation = Marker(
                              markerId: const MarkerId('origin'),
                              infoWindow: const InfoWindow(title: 'origin'),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueGreen),
                              position: newlocation,
                            );
                            setState(() {
                              widget.latiTude = newlocation.latitude;
                              widget.longiTude = newlocation.longitude;
                            });
                          },
                        ),
                      ),

                      ////////////////////////////  Button  ////////////////////////////
                      Positioned(
                        bottom: 10,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            // provider
                            widget.latiTude =
                                locationConsumrer.inpositon!.altitude;
                            widget.longiTude =
                                locationConsumrer.inpositon!.longitude;
                            locationConsumrer.googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(
                                      locationConsumrer.inpositon!.latitude,
                                      locationConsumrer.inpositon!.longitude),
                                  zoom: 19)),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 30,
                                ),
                                Text(
                                  "الموقع الحالي",
                                  style: bold16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
            Container(
              height: getsize(context).height * 0.1,
              alignment: Alignment.center,
              width: getsize(context).width,
              child: SizedBox(
                width: getsize(context).width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "تاكيد العنوان",
                      style: normal15,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen2()),
                      );
                    }),
              ),
            )
          ],
        );
      }),
    );
  }
}
