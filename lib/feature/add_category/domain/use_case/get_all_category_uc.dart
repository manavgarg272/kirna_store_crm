

import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/domain/repo/category_repo.dart';

class GetAllCategoryDataUc extends UseCaseForNoParams<List<CategoryModel>>{
 final CategoryAddRepo categoryRepo;
 GetAllCategoryDataUc({
    required this.categoryRepo
  });

  @override
  Future<List<CategoryModel>> call() {
    // TODO: implement call
    return categoryRepo.getAllCategoryModel();
  }}