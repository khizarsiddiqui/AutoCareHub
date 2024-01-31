import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/shop_product_card.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';
import 'package:mechanics_mangao/services/product_service.dart';

import '../../../size_config.dart';
import 'section_title2.dart';

class CarPackages extends StatelessWidget {
  const CarPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(21)),
          child: SectionTitle(title: "Car Service Packages", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        FutureBuilder<List<ShopProduct>>(
          future: ProductService().fetchCarServiceProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched
            } else if (snapshot.hasError) {
              // ignore: avoid_print
              print('Error fetching data: ${snapshot.error}');
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No car service packages available.');
            } else {
              List<ShopProduct>? carServicePackages = snapshot.data;
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing:
                    1, // Adjust this value to decrease vertical spacing
                crossAxisSpacing:
                    0, // Adjust this value to decrease horizontal spacing
                children: carServicePackages!.map((product) {
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
