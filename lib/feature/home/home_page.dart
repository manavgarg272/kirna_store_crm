
import 'package:flutter/material.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/add_category.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/manager/get_all_category_notifier.dart';
import 'package:kirana_store_crm/feature/add_products/presentation/add_product.dart';
import 'package:kirana_store_crm/feature/home/home_dawer.dart';
import 'package:kirana_store_crm/feature/home/home_screen.dart';
import 'package:kirana_store_crm/feature/home/manager/drawer_notifer.dart';
import 'package:kirana_store_crm/feature/sub_category/presentation/add_subcategory.dart';
import 'package:kirana_store_crm/feature/sub_category/presentation/manager/get_sub_category_notifier.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    WidgetsBinding.instance
    .addPostFrameCallback((_)  {
      context.read<GetAllCategoryNotifer>().getAllCategoryData();
      context.read<GetSubCategoryNotifier>().getAllSubCategoryData();
   
    });
   
 
   
   super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


      drawer: const DrawerScreenWidget(),
      body: getDrawerScreen(context.watch<DrawerNotifier>().drawerIndex)
  
    );
  }
}



Widget getDrawerScreen(int indexScreen){

  switch (indexScreen) {
    case 3:
      return AddCategoryPage();
    case 1:
      return AddProductList();
    case 2:
      return AddProductList();

    default:
      return SubCategoryData();
  }
}