import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirana_store_crm/core/services/fireabse_service/firebase_service.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';

abstract class SubCategoryDs {
  Future<void> subcategoryRepoDs({required SubCategoryModel subCategoryRepo});
  Future<List<SubCategoryModel>> getAllSubCategoryDs();

  Future<List<SubCategoryModel>> getAllSubCategoryByCategoryByDs(
      {required String? categoryId});
}

class SubCategoryDsImpl extends SubCategoryDs {
  @override
  Future<void> subcategoryRepoDs(
      {required SubCategoryModel subCategoryRepo}) async {
    try {
      FirestoreDatabase db = FirestoreDatabase();
      db.writeData("SubCategoryData", subCategoryRepo.toJson());
      return;
    } catch (e) {
      print("sucategoryrepo $e");
    }
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategoryDs() async {
    List<SubCategoryModel> subCategoryList = [];
    try {
      FirestoreDatabase db = FirestoreDatabase();
      QuerySnapshot? querySnapshot =
          await db.readDataFromCollection('SubCategoryData');
      for (var doc in querySnapshot!.docs) {
        var categoryData = doc.data() as Map<String, dynamic>;
        subCategoryList.add(SubCategoryModel.fromJson(categoryData));
      }
    } catch (e) {
      print("sucategoryrepo $e");
    }

    return subCategoryList;
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategoryByCategoryByDs(
      {required String? categoryId}) async {
    List<SubCategoryModel> subCategoryList = [];
    try {
      FirestoreDatabase db = FirestoreDatabase();
      QuerySnapshot? querySnapshot =
          await db.readDataFromCollectionWithFilterEqual(
              'SubCategoryData', 'categoryId', categoryId ?? "");
      for (var doc in querySnapshot!.docs) {
        var categoryData = doc.data() as Map<String, dynamic>;
        subCategoryList.add(SubCategoryModel.fromJson(categoryData));
      }
    } catch (e) {
      print("sucategoryrepo $e");
    }
    return subCategoryList;
  }
}
