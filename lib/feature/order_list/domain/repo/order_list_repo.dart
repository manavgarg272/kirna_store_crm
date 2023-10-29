

import 'package:kirana_store_crm/feature/order_list/data/model/order_list_model.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/user_location.dart';

abstract class OrderListRepo {
  Future<List<UserOrderPlacedModel>> userOrderPlacedListRepo();
  Future<UserLocationModelData> userLocationPlacedRepo({required String locationId});
  Future<void> changeOrderStatus({required String documentId, required  String updatedValue});

}