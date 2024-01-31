import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ShopProduct>> fetchCarServiceProducts() async {
    try {
      final querySnapshot = await _firestore
          .collection('products')
          .where('category', isEqualTo: 'Car Service')
          .get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ShopProduct.fromMap(data, doc.id);
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching car service products: $e");
      return [];
    }
  }

  Future<List<ShopProduct>> fetchSparePartProducts() async {
    try {
      final querySnapshot = await _firestore
          .collection('products')
          .where('category', isEqualTo: 'Spare Part')
          .get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ShopProduct.fromMap(data, doc.id);
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching car service products: $e");
      return [];
    }
  }
}
