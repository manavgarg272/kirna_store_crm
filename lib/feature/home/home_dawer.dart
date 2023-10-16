import 'package:flutter/material.dart';
import 'package:kirana_store_crm/feature/home/manager/drawer_notifer.dart';
import 'package:provider/provider.dart';

class DrawerScreenWidget extends StatelessWidget {
  const DrawerScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: Column(
    children: [
      const UserAccountsDrawerHeader(
        accountName: Text(
          'Manav Garg',
        ),
        accountEmail: Text(
          'Manavgarg272@gmail.com',
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text("Home"),
        onTap: () {
          Navigator.of(context).pop();
          context.read<DrawerNotifier>().drawerIndex = 0;
        },
      ),
      ExpansionTile(
          leading: const Icon(Icons.home),
          title: const Text(
            'Products',
          ),
          children: [
            ListTile(
              title: const Text(
                'Add Products',
              ),
              onTap: () {
                Navigator.of(context).pop();
                context.read<DrawerNotifier>().drawerIndex = 1;
              },
            ),
            ListTile(
              title: const Text(
                'Show Products',
              ),
              onTap: () {
                Navigator.of(context).pop();
                context.read<DrawerNotifier>().drawerIndex = 2;
              },
            ),
          ]),
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text(
            'Add Categories',
          ),
          onTap: () {
            Navigator.of(context).pop();
            context.read<DrawerNotifier>().drawerIndex = 3;
          }),
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text(
            'Banner Update',
          ),
          onTap: () {
            Navigator.of(context).pop();
            context.read<DrawerNotifier>().drawerIndex = 4;
          }),
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text(
            'My Orders',
          ),
          onTap: () {
            Navigator.of(context).pop();
            context.read<DrawerNotifier>().drawerIndex = 5;
          }),
    ]));
  }
}
