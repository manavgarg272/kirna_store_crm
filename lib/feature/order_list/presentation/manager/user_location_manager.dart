import 'package:flutter/foundation.dart';
import 'package:kirana_store_crm/feature/order_list/data/data_source/order_list_ds.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/user_location.dart';
import 'package:kirana_store_crm/feature/order_list/data/repo_impl/order_repo_impl.dart';
import 'package:kirana_store_crm/feature/order_list/domain/use_case/user_location_use_case.dart';

enum UserLocationManagerNotifierState { loading, loaded, error, initial }

class UserLocationManagerNotifier extends ChangeNotifier {
  UserLocationManagerNotifierState _userLocationManagerNotifierState =
      UserLocationManagerNotifierState.initial;
  UserLocationManagerNotifierState get userLocationManagerNotifierState =>
      _userLocationManagerNotifierState;
  set userLocationManagerNotifierState(UserLocationManagerNotifierState value) {
    _userLocationManagerNotifierState = value;
    notifyListeners();
  }

  final UserLocationUseCase _userLocationUseCase = UserLocationUseCase(
      orderListRepo: OrderListRepoImpl(orderListDs: OrderListDsImpl()));

  late UserLocationModelData _userLocationModelData;
  UserLocationModelData get userLocationModelData=>_userLocationModelData;
  set userLocationModelData (UserLocationModelData value){
    _userLocationModelData= value;
    notifyListeners();
  }

  Future<void> getUserLocationAddress({required String locationId})async {

    try{
      userLocationManagerNotifierState = UserLocationManagerNotifierState.loading;
      userLocationModelData = await _userLocationUseCase(locationId);
      userLocationManagerNotifierState = UserLocationManagerNotifierState.loaded;
    }
    catch(e){
      print("location address $e");
    }
  }

}
