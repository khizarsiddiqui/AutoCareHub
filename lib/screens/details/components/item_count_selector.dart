import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/rounded_icon_btn.dart';
import 'package:mechanics_mangao/size_config.dart';

class ItemCountSelector extends StatelessWidget {
  final int itemCount;
  final void Function(int itemCount) onItemCountChanged;

  ItemCountSelector({
    required this.itemCount,
    required this.onItemCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(101)),
          child: Text(
            'Select Quantity',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ), // Add spacing
        RoundedIconBtn(
          icon: Icons.remove,
          press: () {
            if (itemCount > 0) {
              onItemCountChanged(itemCount - 1);
            }
          },
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(
          '$itemCount',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        RoundedIconBtn(
          icon: Icons.add,
          showShadow: true,
          press: () {
            onItemCountChanged(itemCount + 1);
          },
        ),
      ],
    );
  }
}

class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left side
      children: [
        ItemCountSelector(
          itemCount: 5, // Provide your own item count here
          onItemCountChanged: (newItemCount) {
            // Handle item count change
          },
        ),
        // Other widgets can follow here
      ],
    );
  }
}
