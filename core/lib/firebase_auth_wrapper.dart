import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthWrapper {
  FirebaseAuthWrapper(this._auth);

  final FirebaseAuth _auth;

  Future initialize({bool refresh = false}) async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously().catchError((error) {
        return error;
      });
    }

    if (_auth.currentUser == null) {
      return;
    }

    ///listen to any changes in the user signIn/Out or idToken changes.
    _auth.userChanges().listen((user) async {
      if (_auth.currentUser == null) {
        initialize();
        return;
      }
    });
  }

  User? getCurrentUser() => _auth.currentUser;

  FirebaseAuth firebaseAuth() => _auth;

  ///This method will handle the token refresh logic.
  ///By default if token is expire then firebase refresh the token and return it.
  ///This will not work in our case, as we don't want to wait to get token refresh.
  ///We will refresh the token before 3 minuets of expiry,

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  Map<String, dynamic> parseJwtHeader(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[0]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
