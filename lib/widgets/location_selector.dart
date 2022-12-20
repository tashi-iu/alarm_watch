import 'package:alarm_watch/providers/location_provider.dart';
import 'package:alarm_watch/providers/map_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSelector extends ConsumerWidget {
  final LatLng? initialLatLng;
  final void Function(LatLng)? onChange;

  final LatLng _center = const LatLng(0, 0);
  const LocationSelector({this.initialLatLng, this.onChange, super.key});

  void _onMapCreated(GoogleMapController mapController, WidgetRef ref) {
    ref.listenManual(
      mapThemeProvider,
      (_, value) {
        value.whenData(
          (mapStyle) => mapController.setMapStyle(mapStyle),
        );
      },
      fireImmediately: true,
    );
    ref.listenManual(
      locationProvider,
      ((_, location) {
        location.whenData((position) {
          if (position == null) return;
          mapController.moveCamera(
            CameraUpdate.newLatLng(
              LatLng(
                position.latitude,
                position.longitude,
              ),
            ),
          );
        });
      }),
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      width: double.infinity,
      height: 256,
      child: Stack(
        children: [
          GoogleMap(
            onTap: (latLng) {},
            rotateGesturesEnabled: false,
            compassEnabled: false,
            myLocationEnabled: true,
            gestureRecognizers: <Factory<EagerGestureRecognizer>>{}..add(
                Factory<EagerGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                ),
              ),
            onMapCreated: (controller) => _onMapCreated(controller, ref),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
          ),
          Center(
            child: SizedBox.square(
              dimension: 164,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    99,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
