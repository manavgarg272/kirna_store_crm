import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/domain/repo/sub_category_repo.dart';

class GetSubCategoryCategory extends UseCase<List<SubCategoryModel>, String?> {
  SubCategoryRepo subCategoryRepo;

  GetSubCategoryCategory({required this.subCategoryRepo});
  @override
  Future<List<SubCategoryModel>> call(String? params) async {
    return subCategoryRepo.getAllSubCategoryRepoByCatergory(categoryId: params);
  }
}
