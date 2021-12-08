import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_ecommerce_app/model/product_model.dart';
import 'package:shoes_ecommerce_app/model/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addUserToFirestore(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      return UserModel.fromJson(
          (await _firestore.collection("users").doc(uid).get()).data()!);
    } catch (e) {
      print(e);
      return Future.error("Future:getUserData: [Can't get {$uid} data]");
    }
  }

  Future<List<ProductModel>> getProductsWithCategory(String category) async {
    final list = (await _firestore
            .collection("products")
            .where("category", isEqualTo: category)
            .get())
        .docs
        .map((doc) {
      var data = doc.data();
      data['sizes'] = (data['sizes'] as List).cast<int>();
      return ProductModel.fromJson(data);
    }).toList();

    return list;
  }

  Future<List<String>> getAllCategories() async {
    return (await _firestore.collection("categories").get())
        .docs
        .map((doc) => doc.data()["category"])
        .toList()
        .cast<String>();
  }
}
