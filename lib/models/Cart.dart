import 'ShopProduct.dart';

class Cart {
  final ShopProduct product;
  late final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

List<Cart> demoCarts = [];
