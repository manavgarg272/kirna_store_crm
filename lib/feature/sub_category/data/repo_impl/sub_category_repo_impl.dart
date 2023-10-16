


import 'package:kirana_store_crm/feature/sub_category/data/data_source/sub_category_ds.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/domain/repo/sub_category_repo.dart';

class  SubCategoryRepoImpl extends SubCategoryRepo{

  SubCategoryDs subcategoryDs;

  SubCategoryRepoImpl({
    required this.subcategoryDs
  });

  @override
  Future<void> addSubCategoryRepo({required SubCategoryModel subCategoryRepo}) {
   return subcategoryDs.subcategoryRepoDs(subCategoryRepo: subCategoryRepo);
  }
  
  @override
  Future<List<SubCategoryModel>> getAllSubCategoryRepo() {
    // TODO: implement getAllSubCategoryRepo
    return subcategoryDs.getAllSubCategoryDs();
  }

  
}