import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirana_store_crm/core/services/fireabse_service/firebase_service.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';

abstract class AddCategoryDs {
  bool addCategoryToDs(CategoryModel categoryModel);
  Future<List<CategoryModel>> getAllCategoryModel();
}

class AddCategoryDsImpl extends AddCategoryDs {
  @override
  bool addCategoryToDs(CategoryModel categoryModel) {
    try {
      FirestoreDatabase db = FirestoreDatabase();
      db.writeData("CategoryData", categoryModel.toJson());
      return true;
    } catch (e) {
      print("category write data error: $e");
    }
    return false;
  }

  @override
  Future<List<CategoryModel>> getAllCategoryModel() async {
    List<CategoryModel> allCategoryData = [];
  
    try {
      FirestoreDatabase db = FirestoreDatabase();
      QuerySnapshot? querySnapshot = await db.readDataFromCollection("CategoryData");
  
      for (var doc in querySnapshot!.docs) {
        print("allcategoyrsanpshot ${doc.data()}");
        var categoryData = doc.data() as Map<String, dynamic>;
        allCategoryData.add(CategoryModel.fromJson(categoryData));
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  
    return allCategoryData;
  }
}
