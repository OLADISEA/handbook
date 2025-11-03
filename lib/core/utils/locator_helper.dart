// import 'package:location/location.dart' as loc;
// import 'package:geocoding/geocoding.dart';
//
// Future<Map<String, String?>> getUserAddressAndState() async {
//   final location = loc.Location();
//
//   bool serviceEnabled = await location.serviceEnabled();
//   if (!serviceEnabled) {
//     serviceEnabled = await location.requestService();
//     if (!serviceEnabled) throw Exception('Location service not enabled');
//   }
//
//   loc.PermissionStatus permissionGranted = await location.hasPermission(); //
//   if (permissionGranted == loc.PermissionStatus.denied) {
//     permissionGranted = await location.requestPermission();
//     if (permissionGranted != loc.PermissionStatus.granted) {
//       throw Exception('Location permission not granted');
//     }
//   }
//
//   final locationData = await location.getLocation();
//
//   List<Placemark> placemarks = await placemarkFromCoordinates(
//     locationData.latitude!,
//     locationData.longitude!,
//   );
//
//   if (placemarks.isNotEmpty) {
//     final place = placemarks.first;
//     final fullAddress =
//         '${place.street}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';
//     return {
//       'address': fullAddress,
//       'state': place.administrativeArea,
//     };
//   }
//
//   return {'address': null, 'state': null};
// }
