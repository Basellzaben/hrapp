import 'dart:async';
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'package:hrmsapp/FingerPrint/user_location.dart';
import 'package:fluttertoast/fluttertoast.dart';




class LocationService {
  // Keep track of current Location
  late UserLocation  _currentLocation;
  //Location location = Location();
  // Continuously emit location updates
  StreamController<UserLocation> _locationController =
  StreamController<UserLocation>.broadcast();

  /*LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
          else
            {
              _locationController.add(UserLocation(
                latitude: 0,
                longitude: 0,
              ));
            }
        });
      }
    });
  }*/
  late Position currentposition;


  Stream<UserLocation> get locationStream => _locationController.stream;

/*  Future<UserLocation> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     // var userLocation = await location.getLocation();
      if(  userLocation.latitude !=null ||  userLocation.longitude!=null) {
        _currentLocation = UserLocation(
          latitude: userLocation.latitude,
          longitude: userLocation.longitude,
        );
      }
    } catch (e) {
      print('Could not get the location: $e');
    }
    return _currentLocation;
  }*/
}