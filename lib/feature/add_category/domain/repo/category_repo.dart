
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';

abstract class CategoryAddRepo {
  bool addCategoryToData(CategoryModel categoryModel);
  Future<List<CategoryModel>> getAllCategoryModel();
  
}