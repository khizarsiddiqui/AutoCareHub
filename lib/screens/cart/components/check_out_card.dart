import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/default_button.dart';
import 'package:mechanics_mangao/models/Cart.dart';
import '../../../size_config.dart';
import '../../home/components/OrderSuccessScreen.dart';

class CheckoutCard extends StatefulWidget {
  final List<Cart> cartItems;

  const CheckoutCard({
    super.key,
    required this.cartItems,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  double totalPrice = 0;
  String fullName = '';
  String address = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    fetchUserProfileData();
  }

  Future<void> fetchUserProfileData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          fullName = userData['fullName'];
          address = userData['address'];
          phoneNumber = userData['phoneNumber'];
        });
      }
    }

    // Calculate the total price by iterating through the cartItems list
    final double total = widget.cartItems
        .fold(0, (sum, cart) => sum + (cart.product.price * cart.numOfItem));

    setState(() {
      totalPrice = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text("Please Proceed to Checkout Now",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xFF3C8ED3)),
                    children: [
                      TextSpan(
                        text: "Rs $totalPrice", // Display the total price here
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(160),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: DefaultButton(
                      text: "Book Order",
                      press: () async {
                        List<String> productNames = widget.cartItems
                            .map((cart) => cart.product.title)
                            .toList();

                        final orderData = {
                          'id':
                              DateTime.now().millisecondsSinceEpoch.toString(),
                          'productNames': productNames,
                          'total': totalPrice,
                          'fullName': fullName,
                          'address': address,
                          'phoneNumber': phoneNumber,
                          'totalProducts': widget.cartItems.length,
                          'totalQuantity': widget.cartItems
                              .fold(0, (sum, cart) => sum + cart.numOfItem),
                        };

                        await FirebaseFirestore.instance
                            .collection('orders')
                            .add(orderData);

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const OrderSuccessScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
