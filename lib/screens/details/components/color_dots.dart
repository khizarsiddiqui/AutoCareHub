import 'package:flutter/material.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';
import 'package:mechanics_mangao/size_config.dart';

// import '../../../constants.dart';
import 'item_count_selector.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
    required this.onItemCountChanged, // Add the onItemCountChanged callback
  }) : super(key: key);

  final ShopProduct product;
  final void Function(int itemCount)
      onItemCountChanged; // Define the callback function type

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int _itemNo = 0;

  @override
  void initState() {
    super.initState();
    _itemNo = 0;
  }

  void _onItemCountChanged(int itemCount) {
    setState(() {
      _itemNo = itemCount;
      widget.onItemCountChanged(
          _itemNo); // Notify the parent about the item count change
    });
  }
  // void _incrementItemNo() {
  //   setState(() {
  //     _itemNo++;
  //     widget.onItemCountChanged(_itemNo); // Notify the parent about the item count change
  //   });
  // }
  //
  // void _decrementItemNo() {
  //   setState(() {
  //     if (_itemNo > 0) {
  //       _itemNo--;
  //       widget.onItemCountChanged(_itemNo); // Notify the parent about the item count change
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          // ...List.generate(
          //   widget.product.colors.length,
          //       (index) => ColorDot(
          //     color: widget.product.colors[index],
          //     isSelected: index == _itemNo,
          //   ),
          // ),
          Spacer(),
          ItemCountSelector(
            itemCount: _itemNo,
            onItemCountChanged: _onItemCountChanged,
          )
          // RoundedIconBtn(
          //   icon: Icons.remove,
          //   press: _decrementItemNo,
          // ),
          // SizedBox(width: getProportionateScreenWidth(20)),
          // RoundedIconBtn(
          //   icon: Icons.add,
          //   showShadow: true,
          //   press: _incrementItemNo,
          // ),
        ],
      ),
    );
  }
}

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);
//
//   final Color color;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 2),
//       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//       height: getProportionateScreenWidth(40),
//       width: getProportionateScreenWidth(40),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border: Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:mechanics_mangao/components/rounded_icon_btn.dart';
// import 'package:mechanics_mangao/models/ShopProduct.dart';
//
// import '../../../constants.dart';
// import '../../../size_config.dart';
//
// class ColorDots extends StatelessWidget {
//   const ColorDots({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   final Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     // Now this is fixed and only for demo
//     int selectedColor = 3;
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         children: [
//           ...List.generate(
//             product.colors.length,
//             (index) => ColorDot(
//               color: product.colors[index],
//               isSelected: index == selectedColor,
//             ),
//           ),
//           Spacer(),
//           RoundedIconBtn(
//             icon: Icons.remove,
//             press: () {},
//           ),
//           SizedBox(width: getProportionateScreenWidth(20)),
//           RoundedIconBtn(
//             icon: Icons.add,
//             showShadow: true,
//             press: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);
//
//   final Color color;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 2),
//       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//       height: getProportionateScreenWidth(40),
//       width: getProportionateScreenWidth(40),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//             Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
