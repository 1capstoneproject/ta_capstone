import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  List<String> scopes = [
    'https://www.googleapis.com/auth/userinfo.profile',
    'https://www.googleapis.com/auth/userinfo.email',
    'openid',
  ];

  late GoogleSignIn _googleSignIn;
  Future<AuthService> init() async {
    _googleSignIn = GoogleSignIn(
      scopes: scopes,
      // clientId:
      //     '453247308468-d1nhukc0fet9dg442a7oaa15fve6p39o.apps.googleusercontent.com',
    );
    return this;
  }
  // hp colokin

  Future<GoogleSignInAccount?> googleSignIn() async {
    try {
      final credentials = await _googleSignIn.signIn();
      return credentials;
    } catch (e) {
      Get.printError(info: e.toString());
      return null;
    }
  }
}
