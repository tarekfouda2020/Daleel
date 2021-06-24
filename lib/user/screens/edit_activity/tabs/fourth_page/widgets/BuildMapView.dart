part of 'FourthPageWidgetImports.dart';


class BuildMapView extends StatelessWidget {
  final FourthPageData pageData;

  const BuildMapView({required this.pageData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.78584824345491,-122.40696530789137),
          zoom: 16.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          pageData.controller.complete(controller);
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        trafficEnabled: true,
        zoomControlsEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        indoorViewEnabled: true,
        buildingsEnabled: true,
        mapToolbarEnabled: true,
        zoomGesturesEnabled: true,
      ),
    );
  }
}

