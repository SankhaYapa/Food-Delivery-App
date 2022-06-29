import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/utils/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(kGooglePlex: _kGooglePlex, controller: _controller),
          FooterSection(size: size)
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height / 2,
        child: Stack(
          children: [
            Image.asset(
              Constants.imageAssets('trackingfooter.png'),
              width: size.width,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 82,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Delivery time',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer),
                      CustomText(
                        text: '20 Min',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OrderStatusItem(
                    isCompleted: true,
                    status: 'Order confirmed',
                    statusText: 'Your order has been Confirmed',
                  ),
                  SizedBox(height: 30),
                  OrderStatusItem(
                    isCompleted: true,
                    status: 'Order prepared',
                    statusText: 'Your order has been prepared',
                  ),
                  SizedBox(height: 30),
                  OrderStatusItem(
                    isCompleted: false,
                    status: 'Delivery in progress',
                    statusText: 'Hang on! Your food is on the way ',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({
    Key? key,
    this.isCompleted = true,
    required this.status,
    required this.statusText,
  }) : super(key: key);

  final bool isCompleted;
  final String status;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(svgName: isCompleted ? 'check' : 'uncheck'),
        SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: status,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: statusText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key? key,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
  })  : _kGooglePlex = kGooglePlex,
        _controller = controller,
        super(key: key);

  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 529,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
              markerId: MarkerId("a"),
              position: LatLng(37.43296265331129, -122.08832357078792),
            ),
          }),
    );
  }
}
