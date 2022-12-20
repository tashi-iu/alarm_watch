import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationPermissionProvider =
    StateNotifierProvider((ref) => _LocationPermissionNotifier());

class _LocationPermissionNotifier extends StateNotifier<LocationPermission> {
  _LocationPermissionNotifier() : super(LocationPermission.denied);

  LocationPermission get status => state;

  void checkPermissions() async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) return;
    final newStatus = await Geolocator.checkPermission();
    if (newStatus != state) {
      state = newStatus;
    }
  }
}

final locationProvider = FutureProvider.autoDispose((ref) async {
  final locationPermission = ref.watch(locationPermissionProvider.notifier);
  if (locationPermission.status == LocationPermission.denied ||
      locationPermission.status == LocationPermission.deniedForever) {
    // TODO handle each case gracefully
    return Geolocator.getLastKnownPosition();
  }
  return Geolocator.getCurrentPosition();
});
