import 'package:flutter/widgets.dart';
import 'package:mechanics_mangao/providers/notification_screen.dart';
import 'package:mechanics_mangao/screens/cart/cart_screen.dart';
import 'package:mechanics_mangao/screens/details/details_screen.dart';
import 'package:mechanics_mangao/screens/forgot_password/forgot_password_screen.dart';
import 'package:mechanics_mangao/screens/home/home_screen.dart';
import 'package:mechanics_mangao/screens/profile/profile_screen.dart';
import 'package:mechanics_mangao/screens/shop/shop_screen.dart';
import 'package:mechanics_mangao/screens/sign_in/sign_in_screen.dart';
import 'package:mechanics_mangao/screens/splash/splash_screen.dart';

import 'chat/chat_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ShopScreen.routeName: (context) => ShopScreen(),
  ChatScreen.routeName: (context) => const ChatScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
};
