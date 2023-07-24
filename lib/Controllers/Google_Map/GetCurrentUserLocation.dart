import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocation extends StatefulWidget {
  const GetUserCurrentLocation({super.key});

  @override
  State<GetUserCurrentLocation> createState() => _GetUserCurrentLocationState();
}

List<Placemark> addresses = [];
Placemark first = Placemark();

class _GetUserCurrentLocationState extends State<GetUserCurrentLocation> {
  late Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  // TextEditingController _controller = TextEditingController(
  //     text:
  //         "${first.street}, ${first.postalCode}, ${first.subLocality}, ${first.locality}, ${first.administrativeArea}, ${first.country}");

  CameraPosition position =
      const CameraPosition(target: LatLng(33.70140, 73.04071), zoom: 15);

// Markers for position
  List<Marker> list = [
    const Marker(
        infoWindow: InfoWindow(title: 'Initial Location'),
        position: LatLng(33.70140894534099, 73.04071618947549),
        markerId: MarkerId('1')),
  ];

// To get Current Location of user
  Future<Position?> getCurentPosition() async {
    try {
      await Geolocator.requestPermission()
          .then((value) {})
          .onError((error, stackTrace) async {
        await Geolocator.requestPermission();
      });
      return Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCurentPosition().then((value) async {
      // To add Current Marker and move the camera
      list.add(Marker(
          position: LatLng(value!.latitude, value.longitude),
          infoWindow: const InfoWindow(title: 'Current Location'),
          markerId: const MarkerId("2")));

      final GoogleMapController controllers = await controller.future;
      controllers.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14)));
      // TO get the address of current Location
      addresses =
          await placemarkFromCoordinates(value.latitude, value.longitude);

      first = addresses.first;

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "${first.street}, ${first.postalCode}, ${first.subLocality}, ${first.locality}, ${first.administrativeArea}, ${first.country}")));
      Navigator.pop(context, first);

      //   setState(() {});
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: const Text('Google Maps')),
        body: Stack(children: [
          GoogleMap(
            // To add the initial value if you want
            initialCameraPosition: position,
            onMapCreated: (controllerr) {
              controller.complete(controllerr);
            },
            myLocationEnabled: true,
            mapType: MapType.hybrid,
            markers: Set<Marker>.of(list),
          ),
          Positioned(
            top: 580,
            left: 10,
            child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed: () {
                  //  getCurentPosition().then((value) async {
                  //   // To add Current Marker and move the camera
                  //   list.add(Marker(
                  //       position: LatLng(value!.latitude, value.longitude),
                  //       infoWindow: const InfoWindow(title: 'Current Location'),
                  //       markerId: const MarkerId("2")));

                  //   final GoogleMapController controllers =
                  //       await controller.future;
                  //   controllers.animateCamera(CameraUpdate.newCameraPosition(
                  //       CameraPosition(
                  //           target: LatLng(value.latitude, value.longitude),
                  //           zoom: 25)));
                  //   // TO get the address of current Location
                  //   addresses = await placemarkFromCoordinates(
                  //       value.latitude, value.longitude);

                  //   final first = addresses.first;

                  //   // ignore: use_build_context_synchronously
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text(
                  //           "${first.street}, ${first.postalCode}, ${first.subLocality}, ${first.locality}, ${first.administrativeArea}, ${first.country}")));

                  //   setState(() {});
                  // });
                },
                child: const Icon(Icons.location_on)),
          )
        ]),
      ),
    );
  }
}
