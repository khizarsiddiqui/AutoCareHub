import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/custom_bottom_nav_bar.dart';
import 'package:mechanics_mangao/enums.dart';

import 'components/body.dart';

class ShopScreen extends StatelessWidget {
  static String routeName = "/shop";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.shop),
    );
  }
}
