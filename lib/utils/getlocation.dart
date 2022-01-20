import 'package:geocode/geocode.dart';


class getLocation {
  late String cityName='';

  void getCityF(var longitude, var latitude) async {
    GeoCode geoCode = GeoCode();
    Address address =
    await geoCode.reverseGeocoding(
        latitude: latitude, longitude: longitude);
    cityName = await address.city!;
  }
}