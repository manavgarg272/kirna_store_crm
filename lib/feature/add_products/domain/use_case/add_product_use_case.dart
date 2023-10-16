

import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/add_products/data/model/product_model.dart';
import 'package:kirana_store_crm/feature/add_products/domain/repo/add_product_repo.dart';

class AddProductRepoUseCase extends UseCaseForNoFuture<Future<void>,ProductModel>{

 final  AddProductRepoClass addProductRepoClass;
 AddProductRepoUseCase({
  required this.addProductRepoClass
 });

  @override
  Future<void> call(ProductModel params) {
   return addProductRepoClass.addProductRepo(productModel: params);
  }

}