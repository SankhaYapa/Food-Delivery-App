import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/app_bar_button.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/components/custom_title.dart';
import 'package:food_delivery_app/components/product_card.dart';
import 'package:food_delivery_app/screens/main_screen/resturent_details/resturent_category_section.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/util_function.dart';

class ResturentMenu extends StatefulWidget {
  const ResturentMenu({Key? key}) : super(key: key);

  @override
  _ResturentMenuState createState() => _ResturentMenuState();
}

class _ResturentMenuState extends State<ResturentMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(),
            SizedBox(
              height: 22,
            ),
            ResCategorySection(),
            SizedBox(
              height: 18,
            ),
            CustomTitle(text: 'Best Sellers'),
            ProductList(),
            FooterSection()
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      color: Colors.green,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              text: '3 items',
              color: kwhite,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                CustomText(
                  text: 'View Cart',
                  color: kwhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: CustomText(
                      text: '\$ 20.49',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ProductCard();
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: 6));
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(onTap: () {
          UtilFunction.goBack(context);
        }),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Westway',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: secondarytxtColor,
            ),
            CustomText(
              text: 'Menu',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: primaryTxtColor,
            ),
          ],
        ),
        AppBarButton(
          onTap: () {},
          iconName: 'ion_options-outline',
        )
      ],
    );
  }
}
