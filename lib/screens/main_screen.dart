// import 'dart:async';
// import 'package:geocoder2/geocoder2.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart' as loc;
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../assistance/assistance_method.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//
//   LatLng? pickedLocation;
//   loc.Location location = loc.Location();
//   String? _address;
//
//
//   final Completer<GoogleMapController> _controllerGoogleMap =
//   Completer();
//
//   GoogleMapController? newGoogleMapController;
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(13.111568,80.0978119),
//     zoom: 14.4746,
//   );
//
// GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
//
// double searchLocationContainerHeight = 200;
// double waitingResponseFromDriverContainerHeight  = 0;
// double assignedDriverInfoContainerHeight = 0;
// Position? userCurrentPosition;
//
// var geolocation = Geolocator();
// LocationPermission? _locationPermission;
// double bottomPaddingOfMap = 0;
//
// List<LatLng> PlineCoordinateList =[];
//   Set<Polyline> polylineset = {};
//
//   Set<Marker> markers = {};
//   Set<Circle> circle = {};
//
// String userName = "";
// String userEmail = "";
//
// bool openNavigationDrawer = true;
// bool activeNearByDriverKeyLoaded = false;
//
// BitmapDescriptor? activeNearMyIcon;
//
//
//
// locateUserPosition() async{
//   Position cPosition = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.high);
//  userCurrentPosition   = cPosition;
//  LatLng  LatLngPosition = LatLng(userCurrentPosition!.latitude,userCurrentPosition!. longitude);
//  CameraPosition cameraPosition = CameraPosition(target: LatLngPosition,zoom: 15);
//   newGoogleMapController?.animateCamera(
//     CameraUpdate.newCameraPosition(
//         cameraPosition
//     ),
//   );
// }
//  getAddressFromLatLng() async{
//   try{
//     GeoData data = await Geocoder2.getDataFromCoordinates(
//         latitude: pickedLocation!.latitude,
//         longitude: pickedLocation!.longitude,
//         googleMapApiKey: GOOGLE_API_KEY);
//
//     setState(() {
//       _address = data.address;
//     });
//   }catch (e){
//     print(e);
//   }
//
//  }
//
//  checkIfLocationPermissionAllowed() async{
//   _locationPermission = await Geolocator.requestPermission();
//
//   if(_locationPermission == LocationPermission.denied){
//     _locationPermission = await Geolocator.requestPermission();
//   }
//
//  }
//
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkIfLocationPermissionAllowed();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: Stack(
//           children: [
//             GoogleMap(
//               mapType: MapType.normal,
//                 myLocationEnabled: true,
//                 zoomControlsEnabled: true,
//                 zoomGesturesEnabled: true,
//                 initialCameraPosition: _kGooglePlex,
//                 polylines: polylineset,
//                 markers: markers,
//                 circles: circle,
//               onMapCreated: (GoogleMapController controller){
//                 _controllerGoogleMap.complete(controller);
//                 newGoogleMapController = controller;
//
//                 setState(() {
//
//                 });
//
//               },
//
//               onCameraMove: (CameraPosition? position){
//                    if(pickedLocation!= position!.target)
//                      setState(() {
//                        pickedLocation = position.target;
//                      });
//               },
//               onCameraIdle: (){},
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Padding(padding:
//               const EdgeInsets.only(bottom: 35.0),
//              child: Icon(Icons.location_on),
//             ),
//             ),
//             Positioned(
//                 top: 40,
//                 right:20,
//                 left: 20,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     color: Colors.white,
//
//
//                   ),
//                   padding: EdgeInsets.all(20),
//                   child: Text(_address?? "SetYourPickUpLocation",
//                       overflow: TextOverflow.visible,softWrap: true,),
//
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'dart:async';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LatLng? pickedLocation;
  loc.Location location = loc.Location();
  String? _address;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.111568, 80.0978119),
    zoom: 14.4746,
  );

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  double searchLocationContainerHeight = 200;
 double waitingResponseFromDriverContainerHeight  = 0;
 double assignedDriverInfoContainerHeight = 0;
 Position? userCurrentPosition;

 var geolocation = Geolocator();
 LocationPermission? _locationPermission;
 double bottomPaddingOfMap = 0;

 List<LatLng> PlineCoordinateList =[];
   Set<Polyline> polylineset = {};
//
   Set<Marker> markers = {};
   Set<Circle> circle = {};
//
String userName = "";
String userEmail = "";
//
 bool openNavigationDrawer = true;
 bool activeNearByDriverKeyLoaded = false;

 BitmapDescriptor? activeNearMyIcon;




  @override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();
    locateUserPosition();
  }

  locateUserPosition() async {
    try {
      Position cPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      userCurrentPosition = cPosition;

      LatLng latLngPosition =
      LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
      CameraPosition cameraPosition =
      CameraPosition(target: latLngPosition, zoom: 15);
      newGoogleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );

      // Update pickedLocation to user's current position
      setState(() {
        pickedLocation = latLngPosition;
      });

      // Fetch address for user's current position
      getAddressFromLatLng();
    } catch (e) {
      print("Error locating user position: $e");
    }
  }



  getAddressFromLatLng() async {
    if (pickedLocation == null) return; // Avoid calling API if location is null

    try {
      GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: pickedLocation!.latitude,
        longitude: pickedLocation!.longitude,
        googleMapApiKey: "AIzaSyDNZMjI6BykptQrTCZJiPX2iEwBmd9UZUU", // Replace with your API key
      );

      setState(() {
        _address = data.address;
      });
    } catch (e) {
      print("Error fetching address: $e");
    }
  }

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: _scaffoldState,
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
              },
              onCameraMove: (CameraPosition position) {
                setState(() {
                  pickedLocation = position.target;
                });
              },
              onCameraIdle: () {
                // Fetch address after camera stops moving
                getAddressFromLatLng();
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: Text(
                  _address ?? "Set Your Pick-Up Location",
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
