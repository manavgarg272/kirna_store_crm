import 'package:flutter/foundation.dart';
import 'package:kirana_store_crm/feature/add_category/data/ds/category_ds.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/data/repo_impl/category_repo_impl.dart';
import 'package:kirana_store_crm/feature/add_category/domain/use_case/get_all_category_uc.dart';

enum GetAllCategoryNotifierState { loading, loaded, error, initial }

class GetAllCategoryNotifer extends ChangeNotifier {
  GetAllCategoryNotifierState _getAllCategoryNotifierState =
      GetAllCategoryNotifierState.initial;
  GetAllCategoryNotifierState get getAllCategoryNotifierState =>
      _getAllCategoryNotifierState;
  set getAllCategoryNotifierState(GetAllCategoryNotifierState value) {
    _getAllCategoryNotifierState = value;
    notifyListeners();
  }

  final GetAllCategoryDataUc _getAllCategoryDataUc = GetAllCategoryDataUc(
      categoryRepo: CategoryRepoImpl(addCategoryDs: AddCategoryDsImpl()));
  
  List<CategoryModel> _categoryListData = [];
  List<CategoryModel> get categoryListData => _categoryListData;
  set categoryListData(List<CategoryModel> value) {
    _categoryListData = value;
    notifyListeners();
  }

  Future<List<CategoryModel>> getAllCategoryData() async {
    try {
      getAllCategoryNotifierState = GetAllCategoryNotifierState.loading;
      categoryListData = await _getAllCategoryDataUc();
      getAllCategoryNotifierState = GetAllCategoryNotifierState.loaded;
      return categoryListData;
    } catch (e) {
      getAllCategoryNotifierState = GetAllCategoryNotifierState.error;
      print("Error fetching data: $e");
      return [];
    }
  }
}
