


import 'package:kirana_store_crm/core/usecase/usecases.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/order_list_model.dart';
import 'package:kirana_store_crm/feature/order_list/domain/repo/order_list_repo.dart';

class OrderHistoryUseCase extends UseCaseForNoParams<List<UserOrderPlacedModel>>{
  final OrderListRepo orderListRepo;
  OrderHistoryUseCase({required this.orderListRepo});
  @override
  Future<List<UserOrderPlacedModel>> call() {
   return orderListRepo.userOrderPlacedListRepo();
  }

}