import 'package:kirana_store_crm/core/services/fireabse_service/firebase_service.dart';
import 'package:kirana_store_crm/feature/add_products/data/model/product_model.dart';

abstract class AddProductDetailsDs {
  Future<void> addProductDetailsDs({required ProductModel productModel});
}

class AddProductDetailsDsImpl extends AddProductDetailsDs {
  @override
  Future<void> addProductDetailsDs({required ProductModel productModel}) async {
    try {
      FirestoreDatabase db = FirestoreDatabase();
      db.writeData(
          "AllProductData", productModel.toJson());
      return;
    } catch (e) {
      print("Error uploading file: $e");
    }
    return;
  }
}
