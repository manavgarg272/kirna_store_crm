import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirana_store_crm/core/services/fireabse_service/firebase_service.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/order_list_model.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/user_location.dart';

abstract class OrderListDs {
  Future<List<UserOrderPlacedModel>> userOrderPlacedList();
  Future<UserLocationModelData>  userLocationDs({required String locationId});
  Future<void> changeOrderStatusDs({required String documentId, required String updatedValue});

}

class OrderListDsImpl extends OrderListDs {
  @override
  Future<List<UserOrderPlacedModel>> userOrderPlacedList() async {
    List<UserOrderPlacedModel> orderHistoryOrder = [];
    try {
      FirestoreDatabase fb = FirestoreDatabase();
      QuerySnapshot? snapshotData =
          await fb.readDataFromCollectionWithFilterEqual('OrderSummaryData','orderStatus','INITIATED');   
      for (var doc in snapshotData!.docs) {
        var orderListData = doc.data() as Map<String, dynamic>;
        orderHistoryOrder.add(UserOrderPlacedModel.fromJson(orderListData));
      }
    } catch (e) {
      print("listofuserorderplaced $e");
    }
    return orderHistoryOrder;
  }
  @override
  Future<UserLocationModelData> userLocationDs({required String locationId }) async {
    late UserLocationModelData userLocation;
    try{
      FirestoreDatabase db = FirestoreDatabase();
      DocumentSnapshot ? snapshotdata = await   db.readData('UserDataLocation', locationId);
      userLocation = UserLocationModelData.fromJson(snapshotdata!.data() as Map<String, dynamic>);
    }
    catch(e){
      print("userlocation");
    }
    return userLocation;
  }
  
  @override
  Future<void> changeOrderStatusDs({required String documentId, required String updatedValue}) async {
    try{
      FirestoreDatabase db = FirestoreDatabase();
      await db.updateFieldValue('OrderSummaryData', documentId, 'orderStatus', updatedValue);
    }
    catch(e){
      print("userlocation");
    }
  }
}
