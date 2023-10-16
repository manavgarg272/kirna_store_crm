import 'package:flutter/foundation.dart';
import 'package:kirana_store_crm/feature/sub_category/data/data_source/sub_category_ds.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/data/repo_impl/sub_category_repo_impl.dart';
import 'package:kirana_store_crm/feature/sub_category/domain/use_case/sub_category_repo_uc.dart';

enum SubCategoryNotifierState { initial, loading, loaded, error }

class SubCategoryNotifier extends ChangeNotifier {
  SubCategoryNotifierState _subCategoryNotifierState =
      SubCategoryNotifierState.initial;
  SubCategoryNotifierState get subCategoryNotifierState =>
      _subCategoryNotifierState;
  set subCategoryNotifierState(SubCategoryNotifierState value) {
    _subCategoryNotifierState = value;
    notifyListeners();
  }

  final SubCategoryUseCase _subCategoryUseCase = SubCategoryUseCase(
      subCategoryRepo: SubCategoryRepoImpl(subcategoryDs: SubCategoryDsImpl()));

  Future<void> addSubCategoryData({required SubCategoryModel params}) async {
    try {
      subCategoryNotifierState = SubCategoryNotifierState.loading;
      await _subCategoryUseCase(params);
      subCategoryNotifierState = SubCategoryNotifierState.loaded;
    } catch (e) {
      print("addsubccategoryexception $e");
    }
  }
}
