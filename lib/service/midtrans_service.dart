import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

class MidtransServices extends GetxService {

  late MidtransSDK sdk;

  final bool isProduction = false;
  
  final String clientKey = "SB-Mid-client-qsAKj8XGq22r93WY";
  final String serverKey = "SB-Mid-server-Pe0Ikj4TsLpQdeEtrr4c42w1";

  final String merchantBaseUrl = "https://b1dc-182-253-84-109.ngrok-free.app";

  Future<MidtransServices> init() async {
    Get.printInfo(info: "Initialize Midtrans Services.");
    sdk = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: clientKey,
        merchantBaseUrl: merchantBaseUrl
      ),
    );
    sdk.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
      showPaymentStatus: true,
    );
    return this;
  }
}