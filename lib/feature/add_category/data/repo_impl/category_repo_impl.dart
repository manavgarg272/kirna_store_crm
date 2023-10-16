import 'package:kirana_store_crm/feature/add_category/data/ds/category_ds.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/domain/repo/category_repo.dart';

class CategoryRepoImpl extends CategoryAddRepo {
  AddCategoryDs addCategoryDs;

  CategoryRepoImpl({required this.addCategoryDs});

  @override
  bool addCategoryToData(CategoryModel categoryModel) {
     return addCategoryDs.addCategoryToDs(categoryModel);
  }
  
  @override
  Future<List<CategoryModel>> getAllCategoryModel() {
    return addCategoryDs.getAllCategoryModel();
  }
}
