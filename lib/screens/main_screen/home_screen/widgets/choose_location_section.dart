import 'package:food_delivery_app/components/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/providers/auth/user_provider.dart';
import 'package:food_delivery_app/screens/main_screen/home_screen/home_screen.dart';
import 'package:food_delivery_app/utils/global_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChooseLocationSection extends StatelessWidget {
  const ChooseLocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 42),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomSvg(
                  svgName: 'location',
                ),
                SizedBox(
                  width: 13,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Your Location',
                    ),
                    CustomText(
                      text: value.address,
                      fontSize: 14,
                    )
                  ],
                )
              ],
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacePicker(
                        apiKey: GlobalData.API_KEY,
                        onPlacePicked: (result) {
                          Logger().i(result.formattedAddress);
                          value.setaddress(result);
                          Navigator.of(context).pop();
                        },
                        initialPosition: LatLng(7.8731, 80.7718),
                        useCurrentLocation: true,
                      ),
                    ),
                  );
                },
                child: CustomSvg(svgName: 'ion_options-outline'))
          ],
        ),
      );
    });
  }
}
