import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/default_button.dart';
import 'package:mechanics_mangao/models/Cart.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';
import 'package:mechanics_mangao/models/appointment_booking.dart';
import 'package:mechanics_mangao/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatefulWidget {
  final ShopProduct product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _itemNo = 1;

  String getButtonText(ShopProduct product) {
    if (product.category == "car service") {
      return "Book Car Service"; // Change this to the desired button text
    } else {
      return "Add To Cart"; // Default button text for other categories
    }
  }

  void _addToCart(BuildContext context, ShopProduct product) {
    // Find the Cart for the product in the cart list
    Cart? cartItem =
        demoCarts.firstWhereOrNull((item) => item.product.id == product.id);

    if (cartItem != null) {
      // If the product is already in the cart, increment the numOfItem
      cartItem.numOfItem += _itemNo;
    } else {
      // If the product is not in the cart, create a new Cart item and add it to the cart list
      demoCarts.add(Cart(product: product, numOfItem: _itemNo));
    }

    // Reset the item count to zero
    setState(() {
      _itemNo = 0;
    });

    // Show a snackbar to inform the user that the item was added to the cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.title} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(
                      product: widget.product,
                      onItemCountChanged: (itemCount) {
                        setState(() {
                          _itemNo = itemCount;
                        });
                      },
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: widget.product.category == "Car Service"
                              ? "Book Appointment"
                              : "Add To Cart",
                          press: () {
                            if (widget.product.category == "Car Service") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookAppointmentPage(
                                      productTitle: widget.product.title),
                                ),
                              );
                            } else {
                              // Handle adding to cart action
                              _addToCart(context, widget.product);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
