import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'Special_Offers.dart';
import 'car_packages.dart';
import 'home_header.dart';
import 'welcome_banner.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(0)),
            const WelcomeBanner(),
            SizedBox(height: getProportionateScreenWidth(0)),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(12)),
            const CarPackages(),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }
}
