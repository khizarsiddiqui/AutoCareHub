import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ShopProduct.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  List<ShopProduct> searchResults = []; // List to store the search results
  bool isProductSelected = false; // Flag to track if a product is selected

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextField(
            onTap: () {
              setState(() {
                isProductSelected = false;
                searchResults.clear();
              });
            },
            onChanged: (value) {
              fetchSearchResults(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search product",
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          if (searchResults.isNotEmpty && !isProductSelected)
            SizedBox(
              height:
                  searchResults.length * 50.0, // Calculate height dynamically
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index].title),
                    onTap: () {
                      setState(() {
                        isProductSelected = true;
                      });
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(
                            product: searchResults[index]),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  void fetchSearchResults(String query) async {
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore
        .collection('products')
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: '${query}z')
        .get();

    setState(() {
      searchResults = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String,
            dynamic>?; // Explicitly cast to Map<String, dynamic> or null
        if (data != null) {
          return ShopProduct.fromMap(data, doc.id);
        } else {
          // Handle the case where data is null or not in the expected format
          // You can return a default value or log an error, depending on your app's requirements
          return ShopProduct(
            id: '',
            image: '',
            colors: [],
            rating: 0.0,
            price: 0.0,
            isFavourite: false,
            isPopular: false,
            title: '',
            description: '',
            category: '',
          );
        }
      }).toList();
    });
  }
}
