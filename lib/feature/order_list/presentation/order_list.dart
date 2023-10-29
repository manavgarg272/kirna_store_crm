import 'package:flutter/material.dart';
import 'package:kirana_store_crm/feature/order_list/presentation/manager/order_list_manager.dart';
import 'package:kirana_store_crm/feature/order_list/presentation/order_list_data.dart';
import 'package:provider/provider.dart';
class OrderListPlaced extends StatefulWidget {
  const OrderListPlaced({super.key});

  @override
  State<OrderListPlaced> createState() => _OrderListPlacedState();
}

class _OrderListPlacedState extends State<OrderListPlaced> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderListManagerNotifier>().getOrderListPlaced();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Current Orders List",style: TextStyle(fontSize: size.height/30),),
          ListView.builder(
              itemCount:
                  context.watch<OrderListManagerNotifier>().orderListPlaced.length,
                  shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  OrdersListWidget(userOrderPlaceModel:  context.read<OrderListManagerNotifier>().orderListPlaced[index],)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(size.height / 50),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300)),
                    margin: EdgeInsets.symmetric(
                        vertical: size.height / 80, horizontal: size.height / 30),
                    child: Row(
                      children: [
                        Text("Orderplace list $index"),
                        SizedBox(width: size.width/30,),
                        Text( context.watch<OrderListManagerNotifier>().orderListPlaced[index].orderStatus),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
