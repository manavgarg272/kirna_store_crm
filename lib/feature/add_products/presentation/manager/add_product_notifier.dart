import 'package:flutter/foundation.dart';
import 'package:kirana_store_crm/feature/add_products/data/ds/product_ds.dart';
import 'package:kirana_store_crm/feature/add_products/data/model/product_model.dart';
import 'package:kirana_store_crm/feature/add_products/data/repo_impl/add_product_repo_impl.dart';
import 'package:kirana_store_crm/feature/add_products/domain/use_case/add_product_use_case.dart';

enum AddProductNotiferState { initial, loading, loaded, error }

class AddProductNotifer extends ChangeNotifier {
  AddProductNotiferState _addProductNotiferState =
      AddProductNotiferState.initial;
  AddProductNotiferState get addProductNotiferState => _addProductNotiferState;
  set addProductNotiferState(AddProductNotiferState value) {
    _addProductNotiferState = value;
    notifyListeners();
  }

  final AddProductRepoUseCase _addProductRepoUc = AddProductRepoUseCase(
      addProductRepoClass:
          AddProductRepoImpl(addProductRepoDs: AddProductDetailsDsImpl()));
  Future<void> addProductsToData({required ProductModel product}) async {
    try {
      addProductNotiferState = AddProductNotiferState.loading;
      await _addProductRepoUc(product);
      addProductNotiferState = AddProductNotiferState.loaded;
    } catch (e) {
      print("erroinaddProduct $e");
    }
  }
}
