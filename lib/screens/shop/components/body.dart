import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'shop_header.dart';
import 'shop_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const ShopHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            ShopProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
