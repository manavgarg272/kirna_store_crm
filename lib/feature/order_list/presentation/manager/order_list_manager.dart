import 'package:flutter/foundation.dart';
import 'package:kirana_store_crm/feature/order_list/data/data_source/order_list_ds.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/order_list_model.dart';
import 'package:kirana_store_crm/feature/order_list/data/repo_impl/order_repo_impl.dart';
import 'package:kirana_store_crm/feature/order_list/domain/use_case/order_use_case.dart';

enum OrderListManagerNotifierState { loading, error, loaded, initial }

class OrderListManagerNotifier extends ChangeNotifier {
  OrderListManagerNotifierState _orderListManagerNotifierState =
      OrderListManagerNotifierState.initial;
  OrderListManagerNotifierState get orderListManagerNotifierState =>
      _orderListManagerNotifierState;
  set orderListManagerNotifierState(OrderListManagerNotifierState value) {
    _orderListManagerNotifierState = value;
    notifyListeners();
  }

  List<UserOrderPlacedModel> _orderListPlaced = [];
  List<UserOrderPlacedModel> get orderListPlaced => _orderListPlaced;
  set orderListPlaced(List<UserOrderPlacedModel> value) {
    _orderListPlaced = value;
    notifyListeners();
  }

  final OrderHistoryUseCase _orderHistoryUseCase = OrderHistoryUseCase(
      orderListRepo: OrderListRepoImpl(orderListDs: OrderListDsImpl()));
  Future<void> getOrderListPlaced() async {
    try {
      orderListManagerNotifierState = OrderListManagerNotifierState.loading;
      orderListPlaced = await _orderHistoryUseCase();
      orderListManagerNotifierState = OrderListManagerNotifierState.loaded;
    } catch (e) {
      print("getorderplacedlist $e");
    }
  }
}
