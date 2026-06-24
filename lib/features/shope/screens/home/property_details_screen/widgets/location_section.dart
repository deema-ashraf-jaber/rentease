import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'section_title.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({
    super.key,
    required this.location,
  });

  final String location;

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  static const LatLng gazaFallback = LatLng(31.5017, 34.4668);

  LatLng propertyLatLng = gazaFallback;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocationFromText();
  }

  Future<void> getLocationFromText() async {
    try {
      final query = '${widget.location}, Gaza, Palestine';

      final places = await locationFromAddress(query);

      if (places.isNotEmpty) {
        propertyLatLng = LatLng(
          places.first.latitude,
          places.first.longitude,
        );
      }
    } catch (e) {
      propertyLatLng = gazaFallback;
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

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
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: propertyLatLng,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('property_location'),
                  position: propertyLatLng,
                  infoWindow: InfoWindow(title: widget.location),
                ),
              },
            ),
          ),
        ),
      ],
    );
  }
}