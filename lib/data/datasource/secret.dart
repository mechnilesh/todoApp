import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "901068601747-jjds0ccnq5q0sntukslqd5bec3qpvabn.apps.googleusercontent.com";
  static const IOS_CLIENT_ID = "<enter your iOS client secret>";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}