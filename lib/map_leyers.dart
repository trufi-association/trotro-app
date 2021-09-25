import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trufi_core/models/map_tile_provider.dart';

enum MapLayerIds {
  streets,
  osm,
}

extension LayerIdsToString on MapLayerIds {
  String enumToString() {
    final Map<MapLayerIds, String> enumStrings = {
      MapLayerIds.streets: "Streets",
      MapLayerIds.osm: "OSM",
    };

    return enumStrings[this];
  }
}

Map<MapLayerIds, List<LayerOptions>> mapLayerOptions = {
  MapLayerIds.streets: [
    TileLayerOptions(
      urlTemplate: "https://accra.trufi.dev/tiles/streets/{z}/{x}/{y}@2x.png",
    ),
  ],
  MapLayerIds.osm: [
    TileLayerOptions(
      urlTemplate: "https://accra.trufi.dev/tiles/osm-bright/{z}/{x}/{y}.png",
    ),
  ],
};
Map<MapLayerIds, String> layerImage = {
  MapLayerIds.streets: "assets/images/streets.png",
  MapLayerIds.osm: "assets/images/osm-bright.png",
};

class MapLayer extends MapTileProvider {
  final MapLayerIds mapLayerId;
  final String mapKey;

  MapLayer(this.mapLayerId, {this.mapKey}) : super();

  @override
  List<LayerOptions> buildTileLayerOptions() {
    return mapLayerOptions[mapLayerId];
  }

  @override
  String get id => mapLayerId.enumToString();

  @override
  WidgetBuilder get imageBuilder => (context) => Image.asset(
        layerImage[mapLayerId],
        fit: BoxFit.cover,
      );

  @override
  String name(BuildContext context) {
    return mapLayerId.enumToString();
  }
}
