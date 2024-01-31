import 'package:flutter/material.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.product,
  });

  final ShopProduct product;

  @override
  // ignore: library_private_types_in_public_api
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(280), // Adjust the width as needed
          height: getProportionateScreenWidth(280), // Adjust the height as needed
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.network(widget.product.image, fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
