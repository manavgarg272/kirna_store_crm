import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';

abstract class SubCategoryRepo {
  Future<void> addSubCategoryRepo({required SubCategoryModel subCategoryRepo});

  Future<List<SubCategoryModel>> getAllSubCategoryRepo();

  Future<List<SubCategoryModel>> getAllSubCategoryRepoByCatergory(
      {required String? categoryId});
}
