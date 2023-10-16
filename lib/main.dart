import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/manager/category_notifier.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/manager/get_all_category_notifier.dart';
import 'package:kirana_store_crm/feature/add_products/presentation/manager/add_product_notifier.dart';
import 'package:kirana_store_crm/feature/home/home_page.dart';
import 'package:kirana_store_crm/feature/home/manager/drawer_notifer.dart';
import 'package:kirana_store_crm/feature/sub_category/presentation/manager/get_sub_category_notifier.dart';
import 'package:kirana_store_crm/feature/sub_category/presentation/manager/sub_category_notifier.dart';
import 'package:kirana_store_crm/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => DrawerNotifier()),
        ChangeNotifierProvider(create: (_) => CategoryNotifier()),
        ChangeNotifierProvider(create: (_) => GetAllCategoryNotifer()),
        ChangeNotifierProvider(create: (_) => AddProductNotifer()),
        ChangeNotifierProvider(create: (_) => SubCategoryNotifier()),
        ChangeNotifierProvider(create: (_) => GetSubCategoryNotifier()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
       
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'My Store Dash Board'),
      ),
    );
  }
}

