import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class NotificationService extends GetxService {

  Future<NotificationService> init() async {
    Get.printInfo(info: "Start notification services");
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: "payment_status",
          channelName: "status",
          channelDescription: "show payment status"
        ),
      ],
      channelGroups: [],
      debug: true,
    );
    // get permission
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
      Get.printInfo(info: "Notification permission granted");
    });
    Get.printInfo(info: "Notification services started.");
    return this;
  }
}