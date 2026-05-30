import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'section_title.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  static const LatLng propertyLatLng = LatLng(31.4167, 34.3500);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SectionTitle(title: 'الموقع'),
        ),
        const SizedBox(height: 24),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            height: 220,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: propertyLatLng,
                zoom: 14,
              ),
              markers:  {
                Marker(
                  markerId: MarkerId('property_location'),
                  position: propertyLatLng,
                ),
              },
            ),
          ),
        ),
      ],
    );
  }
}