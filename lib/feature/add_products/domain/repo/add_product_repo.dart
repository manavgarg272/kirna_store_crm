
import 'package:kirana_store_crm/feature/add_products/data/model/product_model.dart';

abstract class AddProductRepoClass{

  Future<void> addProductRepo({required ProductModel productModel });


}