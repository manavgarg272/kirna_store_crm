import 'package:flutter/foundation.dart';
import 'package:kirana_store_crm/feature/sub_category/data/data_source/sub_category_ds.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/data/repo_impl/sub_category_repo_impl.dart';
import 'package:kirana_store_crm/feature/sub_category/domain/use_case/get_all_subcategory_use_case.dart';

enum GetSubCategoryNotifierState { loading, loaded, initial, error }

class GetSubCategoryNotifier extends ChangeNotifier {
  GetSubCategoryNotifierState _getSubCategoryNotifierState =
      GetSubCategoryNotifierState.initial;
  GetSubCategoryNotifierState get getSubCategoryNotifierState =>
      _getSubCategoryNotifierState;

  set getSubCategoryNotifierState(GetSubCategoryNotifierState value) {
    _getSubCategoryNotifierState = value;
    notifyListeners();
  }

  List<SubCategoryModel> _subCategoryModel = [];
  List<SubCategoryModel> get subCategoryModel => _subCategoryModel;
  set subCategoryModel(List<SubCategoryModel> value) {
    _subCategoryModel = value;
    notifyListeners();
  }

  final GetAllSubCategoryUseCase _getAllSubCategoryUseCase =
      GetAllSubCategoryUseCase(
          subCategoryRepo:
              SubCategoryRepoImpl(subcategoryDs: SubCategoryDsImpl()));

  Future<void> getAllSubCategoryData() async {
    try {
      getSubCategoryNotifierState = GetSubCategoryNotifierState.loading;
      subCategoryModel =   await _getAllSubCategoryUseCase();
      getSubCategoryNotifierState = GetSubCategoryNotifierState.loaded;
    } catch (e) {
      print("getallsubcategorydata $e");
    }
  }
}
