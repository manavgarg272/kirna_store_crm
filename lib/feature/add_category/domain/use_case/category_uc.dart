
import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/domain/repo/category_repo.dart';

class AddCategoryModelUc extends UseCase<bool,CategoryModel >{
  CategoryAddRepo getCategoryAddRepo;
  AddCategoryModelUc({
  required this.getCategoryAddRepo
  });

  @override
  Future<bool> call(CategoryModel params)async  {
    return getCategoryAddRepo.addCategoryToData(params);
  }

}