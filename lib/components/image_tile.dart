import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/screens/main_screen/home_screen/widgets/nearest_resturents.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(
      {Key? key, this.isOffer = false, this.height = 120, this.width = 120})
      : super(key: key);

  final bool isOffer;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CustomNetworkImage(
              url:
                  'https://www.elmundoeats.com/wp-content/uploads/2021/02/FP-Quick-30-minutes-chicken-ramen.jpg',
            ),
          ),
          isOffer ? OfferTag() : Container()
        ],
      ),
    );
  }
}
