

import 'package:flutter/material.dart';

class DrawerNotifier extends ChangeNotifier{

  int _drawerIndex = 0;
  int get drawerIndex =>_drawerIndex;
  set drawerIndex(int index){
    _drawerIndex = index;
    notifyListeners();
  }

}