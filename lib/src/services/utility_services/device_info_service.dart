part of services;

class DeviceInfoUtils {
  static final _deviceInfo = DeviceInfoPlugin();

  Future<String> getUserID() async {
    if (kIsWeb) {
      return (await _deviceInfo.webBrowserInfo).userAgent ?? '';
    }
    if (Platform.isIOS) {
      return (await _deviceInfo.iosInfo).identifierForVendor ?? '';
    } else {
      return await FlutterUdid.consistentUdid;
    }
  }
}
