import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);
  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}
class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng intialLocation = const LatLng(22.3039, 70.8022);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: intialLocation,
                zoom: 15.6746,
              ),
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                  markerId: const MarkerId("1"),
                  position: intialLocation,
                ),
              },
              // circles: {
              //   Circle(
              //     circleId: CircleId("1"),
              //     center: intialLocation,
              //     radius: 500,
              //     strokeWidth: 2,
              //     fillColor: Color(0xFF006491).withOpacity(0.2),
              //   ),
              // },
              polygons: {
                Polygon(
                  polygonId: const PolygonId("1"),
                  fillColor: const Color(0xFF006491).withOpacity(0.1),
                  strokeWidth: 2,
                  points: const [
                    LatLng(22.3039, 70.8000),
                    LatLng(22.3029, 70.8022),
                    LatLng(22.3069, 70.8032),
                    LatLng(22.3069, 70.8032),
                    LatLng(22.3049, 70.8022),
                  ],
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
