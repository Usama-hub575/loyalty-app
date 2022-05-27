import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationPage extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: controller.cameraPosition.value,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                circles: controller.circle,
                onMapCreated: (GoogleMapController mapController) {
                  controller.getUserLocation();
                  controller.completer.complete(mapController);
                  mapController.animateCamera(controller.cameraUpdate.value);

                  print('=>map_created');
                },
                onCameraMove: (position) {
                  controller.setCameraPosition(position);
                },
                onCameraIdle: () {
                  controller.setGeoAddress();
                },
              ),
            ),
            Column(
              children: [
                Container(
                  width: sizes.width,
                  height: 40,
                  color: colors.primaryLight,
                ),
                Obx(
                  () => SearchField(
                    controller.locationController.value,
                    onBack: controller.onBack,
                    onTap: controller.onTap,
                    isReadOnly: true,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Obx(
                () => LongButton(
                  'Confirm',
                  onPressed: controller.onConfirm,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                assets.icDropPin,
                color: colors.accentPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
