import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirana_store_crm/feature/order_list/data/model/order_list_model.dart';
import 'package:kirana_store_crm/feature/order_list/presentation/manager/user_location_manager.dart';
import 'package:kirana_store_crm/feature/order_list/presentation/widget/order_summary_widget.dart';
import 'package:provider/provider.dart';

class OrdersListWidget extends StatefulWidget {
  final UserOrderPlacedModel userOrderPlaceModel;
  const OrdersListWidget({super.key, required this.userOrderPlaceModel});

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserLocationManagerNotifier>().getUserLocationAddress(
          locationId: widget.userOrderPlaceModel.locationId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Order History List",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600, fontSize: size.height / 40),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height / 50, horizontal: size.height / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text("Products",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Quantity",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Price",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Total",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                ],
              ),
            ),
            Divider(
              indent: size.height / 30,
              endIndent: size.height / 30,
            ),
            Column(
              children:
                  widget.userOrderPlaceModel.orderList.entries.map((entry) {
                return OrderSummaryWidgetCard(
                  orderModelData: entry.value,
                );
              }).toList(),
            ),
            SizedBox(height: size.height / 30),
            Divider(
              indent: size.height / 30,
              endIndent: size.height / 30,
            ),
            Builder(builder: (context) {
              if (context
                      .watch<UserLocationManagerNotifier>()
                      .userLocationManagerNotifierState ==
                  UserLocationManagerNotifierState.loading) {
                return const CircularProgressIndicator();
              }

              return Container(
                padding: EdgeInsets.all(size.height / 50),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Address",
                      style: GoogleFonts.roboto(
                          fontSize: size.height / 45,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Text(
                        '${context.watch<UserLocationManagerNotifier>().userLocationModelData.address}'),
                  ],
                ),
              );
            }),
            Text(
              "Total Order Amount is Rs 200",
              style: GoogleFonts.roboto(
                  fontSize: size.height / 50, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
