

import 'package:kirana_store_crm/feature/order_list/data/data_source/order_list_ds.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/order_list_model.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/user_location.dart';
import 'package:kirana_store_crm/feature/order_list/domain/repo/order_list_repo.dart';

class OrderListRepoImpl extends OrderListRepo{
  final OrderListDs orderListDs;
  OrderListRepoImpl({required this.orderListDs});
  @override
  Future<List<UserOrderPlacedModel>> userOrderPlacedListRepo() {
    return orderListDs.userOrderPlacedList();
  }

  @override
  Future<UserLocationModelData> userLocationPlacedRepo({required String locationId}) {
   return orderListDs.userLocationDs(locationId: locationId);
  }
  
  @override
  Future<void> changeOrderStatus({required String documentId, required  String updatedValue}) async {
   
    return orderListDs.changeOrderStatusDs(documentId: documentId, updatedValue: updatedValue);
  }
  
}