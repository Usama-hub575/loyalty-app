import 'dart:async';

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;

class LocationController extends GetxController with StateMixin<LocationPage> {
  final LocationUseCase useCase;

  LocationController(this.useCase);

  Rx<TextEditingController> locationController = TextEditingController().obs;
  Completer<GoogleMapController> completer = Completer();

  Rx<bool> isLoading = false.obs;
  Location _location = Location();
  LocationData _locationData;
  BitmapDescriptor currentLocationIcon;
  List<geo.Placemark> _geoAddress;
  LocationModel result = LocationModel();
  Rx<CameraPosition> cameraPosition = CameraPosition(
    target: LatLng(32.488140, 74.392461),
    zoom: 15.0,
  ).obs;

  RxSet<Circle> circle = Set<Circle>.from([
    Circle(
      circleId: CircleId('currentLocation'),
    )
    // Marker(
    //     markerId: MarkerId('currentLocation'),
    //     icon: BitmapDescriptor.defaultMarkerWithHue(10)),
  ]).obs;

  Rx<CameraUpdate> cameraUpdate =
      CameraUpdate.newLatLng(LatLng(31.488140, 74.392461)).obs;

  @override
  void onInit() {
    super.onInit();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), assets.currentLocation)
        .then((value) => {
              currentLocationIcon = value,
            });
  }

  void getUserLocation() async {
    PermissionStatus _permissionStatus = await _location.requestPermission();
    if (_permissionStatus == PermissionStatus.granted ||
        _permissionStatus == PermissionStatus.grantedLimited) {
      bool _serviceEnabled = await _location.requestService();
      if (_serviceEnabled) {
        _locationData = await _location.getLocation();
        cameraPosition.value = CameraPosition(
          target: LatLng(_locationData.latitude, _locationData.longitude),
        );
        cameraUpdate.value =
            CameraUpdate.newCameraPosition(cameraPosition.value);
        circle = Set<Circle>.from([
          Circle(
            circleId: CircleId('currentLocation'),
            center: LatLng(_locationData.latitude, _locationData.longitude),
            strokeColor: colors.accentPrimary.withOpacity(0.2),
            fillColor: colors.accentPrimary.withOpacity(0.1),
            strokeWidth: 20,
            radius: 80,
            visible: true,
          ),

          // Marker(
          //   markerId: MarkerId('currentLocation'),
          //   position: LatLng(_locationData.latitude, _locationData.longitude),
          //   icon: currentLocationIcon,
          // ),
        ]).obs;
      }
    }
    // moveCameraToUserLocation();
  }

  get currentLocation => _locationData;

  void setCameraPosition(CameraPosition position) {
    cameraPosition.value = position;
    cameraUpdate.value = CameraUpdate.newCameraPosition(cameraPosition.value);

    print('position=>' + position.toString());
  }

  Future<void> setGeoAddress() async {
    _geoAddress = await geo.placemarkFromCoordinates(
      cameraPosition.value.target.latitude,
      cameraPosition.value.target.longitude,
    );
    locationController.value.text =
        _geoAddress[0].street + ', ' + _geoAddress[0].subLocality;
    print('geoAddress1=>  ' + _geoAddress[0].toString());
  }

  Future<void> setGeoLatLng() async {
    var locationList = await geo.locationFromAddress(
        locationController.value.text,
        localeIdentifier: 'en_PK');
    CameraPosition position = CameraPosition(
      target: LatLng(locationList[0].latitude, locationList[0].longitude),
    );
    setCameraPosition(position);
  }

  onBack() {
    Get.back(result: result);
  }

  onTap() async {
    String address = await AppRoutes.appRoutes(RouteNames.searchAddressScreen);
    print('address --->' + address);
    if (address.isNotEmpty) {
      locationController.value.text = address;
      setGeoLatLng();
    }
  }

  onConfirm() async {
    if (!isLoading.value) {
      isLoading.value = true;
      await setGeoAddress();

      result = LocationModel(
        latitude: cameraPosition.value.target.latitude,
        longitude: cameraPosition.value.target.longitude,
        geoAddress: _geoAddress[0].street +
            ', ' +
            _geoAddress[0].subLocality +
            ', ' +
            _geoAddress[0].locality +
            ', ' +
            _geoAddress[0].country,
      );

      final either = await useCase.saveUserLocation(result);
      either.fold(
        (left) => {
          print(left),
          isLoading.value = false,
        },
        (right) => {
          isLoading.value = false,
          onBack(),
        },
      );
    }
  }
}
