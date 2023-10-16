


import 'package:kirana_store_crm/feature/add_products/data/ds/product_ds.dart';
import 'package:kirana_store_crm/feature/add_products/data/model/product_model.dart';
import 'package:kirana_store_crm/feature/add_products/domain/repo/add_product_repo.dart';

class AddProductRepoImpl extends AddProductRepoClass{

  final AddProductDetailsDs addProductRepoDs;
  AddProductRepoImpl({
    required this.addProductRepoDs
  });

  @override
  Future<void> addProductRepo({required ProductModel productModel}) {
   return addProductRepoDs.addProductDetailsDs(productModel: productModel);
  }
  
  
}