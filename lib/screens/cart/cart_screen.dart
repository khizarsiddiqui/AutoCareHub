import 'package:flutter/material.dart';
 import 'package:mechanics_mangao/models/Cart.dart';

 import 'components/body.dart';
 import 'components/check_out_card.dart';

 class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
       bottomNavigationBar: CheckoutCard(cartItems: demoCarts),
     );
   }

   AppBar buildAppBar(BuildContext context) {
     return AppBar(
       title: Column(
         children: [
           Text(
             "Your Cart",
             style: TextStyle(color: Colors.black),
           ),
           Text(
             "${demoCarts.length} items",
             style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
       ),
       backgroundColor: Color(0xFF3C8ED3),
     );
   }
 }


