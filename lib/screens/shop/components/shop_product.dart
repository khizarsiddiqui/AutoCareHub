import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/shop_product_card.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';
import 'package:mechanics_mangao/services/product_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class ShopProducts extends StatelessWidget {
  const ShopProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Shop Spare Parts", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder<List<ShopProduct>>(
          future: ProductService()
              .fetchSparePartProducts(), // Fetch spare parts products
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched
            } else if (snapshot.hasError) {
              print('Error fetching data: ${snapshot.error}');
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No spare parts available.');
            } else {
              List<ShopProduct>? spareParts = snapshot.data;
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 1,
                crossAxisSpacing: 0,
                children: spareParts!.map((product) {
                  return ShopProductCard(product: product);
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
