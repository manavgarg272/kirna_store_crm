import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kirana_store_crm/feature/add_category/data/ds/category_ds.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/data/repo_impl/category_repo_impl.dart';
import 'package:kirana_store_crm/feature/add_category/domain/use_case/category_uc.dart';
import 'dart:io' as io;
enum CategoryNotifierState { loading, initial, loaded, error }

class CategoryNotifier extends ChangeNotifier {

  CategoryNotifierState _getCategoryNotifierState=CategoryNotifierState.initial;
  CategoryNotifierState get categoryNotifierState=>_getCategoryNotifierState;
  set categoryNotifierState(CategoryNotifierState state) {
    _getCategoryNotifierState=state;
    notifyListeners();
  }

  final AddCategoryModelUc  _addCategoryModel = AddCategoryModelUc(getCategoryAddRepo: CategoryRepoImpl(addCategoryDs:AddCategoryDsImpl()));
  bool _addCategory=false;
  bool get addCategory =>_addCategory;
  set addCategory(bool value){
    _addCategory=value;
     notifyListeners();
  }

  Future<void> storeCategoryData({required CategoryModel data}) async {
    try {
      categoryNotifierState=CategoryNotifierState.loading;
      addCategory=   await _addCategoryModel(data);
      categoryNotifierState=CategoryNotifierState.loaded;
    } catch (e) {}
  }


 
}
