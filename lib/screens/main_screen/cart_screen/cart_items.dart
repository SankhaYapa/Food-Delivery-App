import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/components/image_tile.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: Colors.black12,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageTile(
              isOffer: false,
              width: 90,
              height: 90,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              children: [
                CustomText(
                  text: 'Burger with some',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xffF8FFA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        iconSize: 10,
                      ),
                      CustomText(
                        text: '1',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                        iconSize: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  iconSize: 15,
                ),
                CustomText(
                  text: '152',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
