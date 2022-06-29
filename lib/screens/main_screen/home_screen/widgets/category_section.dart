import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            CategoryTile(
              svgName: 'food',
              categoryName: 'All',
            ),
            CategoryTile(
              svgName: 'ion_pizza-outline',
              categoryName: 'Pizza',
            ),
            CategoryTile(
              svgName: 'bx_bx-drink',
              categoryName: 'Bevarages',
            ),
            CategoryTile(
              svgName: 'fe_rice-cracker',
              categoryName: 'Asian',
            ),
            CategoryTile(
              svgName: 'fe_rice-cracker',
              categoryName: 'Asian',
            ),
            CategoryTile(
              svgName: 'fe_rice-cracker',
              categoryName: 'Asian',
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    Key? key,
    required this.svgName,
    required this.categoryName,
  }) : super(key: key);
  final String svgName;
  final String categoryName;

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
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
              width: 65,
              height: 65,
              padding: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: isSelect ? korange : kwhite,
                  borderRadius: BorderRadius.circular(15)),
              child: CustomSvg(
                svgName: widget.svgName,
                color: isSelect ? kwhite : grayColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            CustomText(
              text: widget.categoryName,
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
