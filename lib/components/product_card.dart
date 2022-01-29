import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/components/image_tile.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

import 'dialog_helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
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
                offset: Offset(0, 10), blurRadius: 20, color: Colors.black12)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageTile(
                isOffer: true,
                width: 90,
                height: 90,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Vegitable Salad',
                    fontSize: 14,
                  ),
                  CustomText(
                    text: 'In Pizza Mania',
                    fontSize: 12,
                    color: grayColor,
                  ),
                  CustomText(
                    text: 'Price. 152.00',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogHelper(
                      iconName: 'shopping-cart',
                      text1: 'Succesfully \n added to cart',
                      buttonName: "Check Out Now",
                      btnOntap: () {},
                    );
                  });
            },
            child: Icon(
              Icons.add,
              color: grayColor,
            ),
          )
        ],
      ),
    );
  }
}
