import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/shop_product_card.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class ShopProducts extends StatefulWidget {
  const ShopProducts({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShopProductsState createState() => _ShopProductsState();
}

class _ShopProductsState extends State<ShopProducts> {
  List<ShopProduct> products = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Shop Spare Parts", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling in the grid
          children: products
              .where((product) => product.isPopular)
              .map((product) => ShopProductCard(product: product))
              .toList(),
        ),
      ],
    );
  }
}
