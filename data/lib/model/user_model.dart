class UserModel {
  final String name;
  final String imageUrl;
  final String countryCode;
  final String number;
  final String email;
  final String profileType;
  final String jwt;

  UserModel({
    this.name = '',
    this.imageUrl = '',
    this.number = '',
    this.email = '',
    this.countryCode = '',
    this.profileType = '',
    this.jwt = '',
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      number: json['number'],
      email: json['email'],
      countryCode: json['countryCode'],
      profileType: json['profileType'],
      jwt: json['jwt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': 'imageUrl',
        'number': number,
        'email': email,
        'countryCode': countryCode,
        "profileType": "CUSTOMER",
      };
}
