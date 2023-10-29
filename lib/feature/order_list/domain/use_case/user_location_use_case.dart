import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/user_location.dart';
import 'package:kirana_store_crm/feature/order_list/domain/repo/order_list_repo.dart';

class UserLocationUseCase extends UseCase<UserLocationModelData, String> {
  final OrderListRepo orderListRepo;
  UserLocationUseCase({required this.orderListRepo});

  @override
  Future<UserLocationModelData> call(String params) async {
      return orderListRepo.userLocationPlacedRepo(locationId: params);
  }
}
