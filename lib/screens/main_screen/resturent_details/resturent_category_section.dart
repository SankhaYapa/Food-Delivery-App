import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_title.dart';
import 'package:food_delivery_app/screens/main_screen/resturent_details/resturent_details_screen.dart';

class ResCategorySection extends StatelessWidget {
  const ResCategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(text: 'Westway Food Menu'),
        SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ResCategoryTile(
                  categoryName: 'All',
                ),
                ResCategoryTile(
                  categoryName: 'Pizza',
                ),
                ResCategoryTile(
                  categoryName: 'Bevarages',
                ),
                ResCategoryTile(
                  categoryName: 'Asian',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
