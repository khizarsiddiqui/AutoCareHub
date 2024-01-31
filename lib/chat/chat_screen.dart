import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/custom_bottom_nav_bar.dart';
import 'package:mechanics_mangao/enums.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = "/chat";

  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.chat),
    );
  }
}
