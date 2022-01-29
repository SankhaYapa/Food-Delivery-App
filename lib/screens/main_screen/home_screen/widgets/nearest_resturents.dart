import 'package:flutter/material.dart';

import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/components/image_tile.dart';
import 'package:food_delivery_app/screens/main_screen/resturent_details/resturent_details_screen.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/util_function.dart';

class NearestResturentSection extends StatelessWidget {
  const NearestResturentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            ResturentTile(
              isOffer: true,
            ),
            ResturentTile(),
            ResturentTile(),
            ResturentTile(),
            ResturentTile(),
          ],
        ),
      ),
    );
  }
}

class ResturentTile extends StatelessWidget {
  const ResturentTile({
    Key? key,
    this.isOffer = false,
  }) : super(key: key);
  final bool isOffer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () => UtilFunction.navigateTo(context, ResturentDetailsScreen()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageTile(isOffer: isOffer),
            SizedBox(
              height: 5,
            ),
            CustomText(
              text: 'Westway',
              fontSize: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 15,
                    ),
                    CustomText(
                      text: '4.6 •',
                      fontSize: 12,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: grayColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CustomText(
                      text: '15 min',
                      fontSize: 12,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OfferTag extends StatelessWidget {
  const OfferTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 79,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: korange,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15))),
        child: CustomText(
          text: '50% OFF',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: kwhite,
        ),
      ),
    );
  }
}
