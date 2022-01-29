import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/app_bar_button.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/components/custom_title.dart';

import 'package:food_delivery_app/components/product_card.dart';

import 'package:food_delivery_app/screens/main_screen/resturent_details/resturent_category_section.dart';
import 'package:food_delivery_app/screens/main_screen/resturent_menu/resturent_menu.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/util_function.dart';

class ResturentDetailsScreen extends StatefulWidget {
  const ResturentDetailsScreen({Key? key}) : super(key: key);

  @override
  _ResturentDetailsScreenState createState() => _ResturentDetailsScreenState();
}

class _ResturentDetailsScreenState extends State<ResturentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperSection(size: size),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResturentDetailsSection(),
                SizedBox(height: 23),
                ResCategorySection(),
                SizedBox(height: 20),
                CustomTitle(text: 'Best Products'),
                SizedBox(height: 20),
                ProductListSection(),
                GestureDetector(
                  onTap: () {
                    UtilFunction.navigateTo(context, ResturentMenu());
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 30, bottom: 10, top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: 'See our menu',
                        fontSize: 14,
                        color: korange,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.only(bottom: 20, top: 5),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductCard();
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 3),
    );
  }
}

class ResCategoryTile extends StatefulWidget {
  const ResCategoryTile({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  _ResCategoryTileState createState() => _ResCategoryTileState();
}

class _ResCategoryTileState extends State<ResCategoryTile> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelect = !isSelect;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: isSelect ? korange : kwhite,
                    borderRadius: BorderRadius.circular(15)),
                child: CustomText(
                  text: widget.categoryName,
                  fontSize: 14,
                  color: isSelect ? kwhite : grayColor,
                )),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class ResturentDetailsSection extends StatelessWidget {
  const ResturentDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(
                  text: 'Westway',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: primaryColor,
                          size: 15,
                        ),
                        CustomText(
                          text: '4.6 • ',
                          fontSize: 15,
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
                          text: '4.6 min',
                          fontSize: 15,
                        )
                      ],
                    ),
                  ],
                ),
              ]),
              CustomText(
                text: "More info",
                fontSize: 14,
                color: korange,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text:
                'Healthy eating means eating a variety of foods that give you the nutrients you need to maintain your health, feel good, and have energy.',
            fontSize: 15,
            color: grayColor,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Container(
            height: 320,
            width: size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(65),
                  bottomRight: Radius.circular(65)),
              child: CustomNetworkImage(
                url:
                    'https://www.elmundoeats.com/wp-content/uploads/2021/02/FP-Quick-30-minutes-chicken-ramen.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarButton(onTap: () {}),
                Row(
                  children: [
                    AppBarButton(
                      onTap: () {},
                      iconName: 'hart',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    AppBarButton(
                      onTap: () {},
                      iconName: 'share',
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
