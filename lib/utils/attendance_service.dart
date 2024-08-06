import 'package:geolocator/geolocator.dart';

class AttendanceService {
  Future<Map<String, dynamic>> getCurrentDateTimeAndLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Location services are disabled.");
      }

      // Check for location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          throw Exception("Location permissions are denied.");
        }
      }

      // Fetch the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get the current timestamp
      String timestamp = DateTime.now().toString();

      return {
        'location': position,
        'timestamp': timestamp,
      };
    } catch (e) {
      // Handle any errors
      throw Exception("Failed to fetch location or date-time: $e");
    }
  }
}
