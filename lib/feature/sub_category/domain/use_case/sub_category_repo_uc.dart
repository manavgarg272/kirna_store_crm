


import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/domain/repo/sub_category_repo.dart';

class SubCategoryUseCase extends UseCase<void ,SubCategoryModel>{

  SubCategoryRepo subCategoryRepo;
  SubCategoryUseCase({
    required this.subCategoryRepo
  });

  @override
  Future<void> call(SubCategoryModel params) async {
    return subCategoryRepo.addSubCategoryRepo(subCategoryRepo: params);
  }

}