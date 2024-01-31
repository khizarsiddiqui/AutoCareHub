import 'package:flutter/material.dart';
import 'package:mechanics_mangao/models/Cart.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    // Log an event for each product added to the cart
    analytics.logEvent(
      name: 'product_added_to_cart',
      parameters: {
        'product_id': cart.product.id.toString(),
        'product_title': cart.product.title,
        'quantity': cart.numOfItem.toString(),
      },
    );

    return Row(
      children: [
        SizedBox(
          width: 65,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(cart.product.image),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "Rs${cart.product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                      text: " x${cart.numOfItem}",
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mechanics_mangao/models/Cart.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';
//
// class CartCard extends StatelessWidget {
//   const CartCard({
//     super.key,
//     required this.cart,
//   });
//
//   final Cart cart;
//
//   @override
//   Widget build(BuildContext context) {
//     FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//     return Row(
//       children: [
//         SizedBox(
//           width: 65,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Image.network(cart.product.image),
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 cart.product.title,
//                 style: const TextStyle(color: Colors.black, fontSize: 16),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis, // Add this line to handle overflow
//               ),
//               const SizedBox(height: 10),
//               Text.rich(
//                 TextSpan(
//                   text: "Rs${cart.product.price}",
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w600, color: kPrimaryColor),
//                   children: [
//                     TextSpan(
//                       text: " x${cart.numOfItem}",
//                       // ignore: deprecated_member_use
//                       style: Theme.of(context).textTheme.bodyText1,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }