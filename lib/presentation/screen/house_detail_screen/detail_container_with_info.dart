import 'package:flutter/material.dart';
import '../../../core/vos/house_vos.dart';
import '../../../utils/dimens.dart';
import '../../widget/house_specification_info_with_icon.dart';
import '../../widget/text_view.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as mylatlong;

class DetailContainerWithInfo extends StatelessWidget {

  final HouseVo houseVo;
  const DetailContainerWithInfo({Key? key, required this.houseVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PopupController popupController = PopupController();

    List<Marker> markers;

    List points = [
      mylatlong.LatLng(houseVo.latitude!.toDouble(), houseVo.longitude!.toDouble()),
    ];

    markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 50,
        width: 50,
        point: mylatlong.LatLng(houseVo.latitude!.toDouble(), houseVo.longitude!.toDouble()),
        builder: (ctx) =>const Icon(Icons.pin_drop,color: Colors.transparent,),
      ),
    ];

    return Container(
      padding:
          const EdgeInsets.only(top: 4, left: kPadding14, right: kPadding14),
      height: 300,
      width: 200,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: ListView(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              TextView(
                text: "\$ ${houseVo.price}",
                fontWeight: FontWeight.bold,
                fontSize: k20Font,
              ),
            const   SizedBox(
                width: 12,
              ),
              Flexible(
                child: HouseSpecificationInfoWithIcon(
                  bedrooms: houseVo.bedrooms,
                  size: houseVo.size,
                  bathrooms: houseVo.bathrooms,
                  distance: houseVo.distance,
                ),
              )
            ],
          ),
          const SizedBox(
            height: kPadding18,
          ),
          TextView(
            text: "DESCRIPTION",
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyText2?.color,
            fontSize: k20Font,
          ),
          const SizedBox(
            height: kPadding18,
          ),
          TextView(
            text: houseVo.description??"",
            color: Theme.of(context).hintColor,
            fontSize: k14Font,
          ),
          const SizedBox(
            height: kPadding18,
          ),
          TextView(
            text: "LOCATION",
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyText2?.color,
            fontSize: k20Font,
          ),
          const SizedBox(
            height: kPadding18,
          ),
          SizedBox(
            height: 180,

            child: FlutterMap(
              options: MapOptions(
                center: points[0],
                zoom: 7, //specifies what the zoom level of the map should be when it is first built
                maxZoom: 18, //--> max zoom supported
                minZoom: 3, //--> min zoom supported
                plugins: [
                  MarkerClusterPlugin(),
                ],
                onTap: (_, __) => popupController
                    .hideAllPopups(), // Hide popup when the map is tapped.
              ),
              children: <Widget>[
                TileLayerWidget(
                  options: TileLayerOptions(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                ),
                MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                    maxClusterRadius: 120,
                    size: const Size(40, 40),
                    fitBoundsOptions: const FitBoundsOptions(
                      padding: EdgeInsets.all(50),
                    ),
                    markers: markers,
                    polygonOptions: PolygonOptions(
                        borderColor: Theme.of(context).primaryColor,
                        color: Colors.black12,
                        borderStrokeWidth: 3),
                    popupOptions: PopupOptions(
                        popupSnap: PopupSnap.markerTop,
                        popupController: popupController,
                        popupBuilder: (_, marker) => Container(
                          width: 200,
                          height: 100,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () => debugPrint('Popup tap!'),
                            child: Text(
                              'LatLong Info ${marker.point}',
                            ),
                          ),
                        )),
                    builder: (context, markers) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                           // color: Theme.of(context).primaryColor
                        ),
                        child: Center(
                          child: Icon(Icons.location_on,color : Theme.of(context).primaryColor,size: 32,),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
         const SizedBox(
            height: kPadding18,
          )
        ],
      ),
    );
  }
}

