import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:secondsouffleapp/ui/widgets/base_page.dart';
import 'package:secondsouffleapp/ui/widgets/filter_overlay_content.dart';
import 'package:secondsouffleapp/ui/widgets/overlay.dart';

class MapPage extends BasePage {
  const MapPage({super.key}) : super(selectedIndex: 0);

  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();

  @override
  Widget buildPage(BuildContext context) {
    return const MapContent();
  }
}

class _MapPageState extends BasePageState<MapPage> {}

class MapContent extends StatefulWidget {
  const MapContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapContentState createState() => _MapContentState();
}

class _MapContentState extends State<MapContent> {
  final MapController _mapController = MapController();
  final List<LatLng> _markers = [
    LatLng(47.2184, -1.5536),
    LatLng(47.4800, -0.5300),
  ];

  late LatLng _center;

  LatLng _calculateCenter(List<LatLng> positions) {
    double totalLat = 0;
    double totalLng = 0;

    for (var position in positions) {
      totalLat += position.latitude;
      totalLng += position.longitude;
    }

    return LatLng(totalLat / positions.length, totalLng / positions.length);
  }

  @override
  void initState() {
    super.initState();
    _center = _calculateCenter(_markers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _center,
              zoom: 7,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: _markers
                    .map(
                      (LatLng latLng) => Marker(
                        width: 42.0,
                        height: 55.0,
                        point: latLng,
                        builder: (_) => const Icon(
                          Icons.location_on,
                          size: 50.0,
                          color: Colors.red,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          Positioned(
            top: 40, // Positioning the search button at the top
            left: 20,
            right: 20,
            child: GestureDetector(
                onTap: () {
                  showOverlay(
                    context,
                    'Filtre et recherche',
                    const FilterOverlayContent(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F304C),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Rechercher',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
