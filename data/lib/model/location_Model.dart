class AddressList {
  final List<LocationModel> list;

  AddressList(this.list);

  factory AddressList.fromJson(dynamic json) {
    List<LocationModel> data = List.empty(growable: true);
    if (json['body'] != null) {
      json['body'].forEach((element) {
        data.add(LocationModel.fromJson(element));
      });
    }
    return AddressList(data);
  }
}

class LocationModel {
  final int locationId;
  final double latitude;
  final double longitude;
  final String geoAddress;
  final String profileType;

  LocationModel({
    this.locationId = 0,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.geoAddress = ' ',
    this.profileType = 'CUSTOMER',
  });

  factory LocationModel.fromJson(dynamic json) {
    return LocationModel(
      locationId: json['locationId'],
      latitude: json['lat'],
      longitude: json['lng'],
      geoAddress: json['geoDecodedAddress'],
      profileType: json['ownerType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'lat': latitude,
        'lng': longitude,
        'geoDecodedAddress': geoAddress,
        'ownerType': "CUSTOMER",
      };
}
