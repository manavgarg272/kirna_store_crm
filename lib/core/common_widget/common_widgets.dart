



import 'package:flutter/material.dart';

class CommonWidgetShow {




  void showSnackBarWidget(BuildContext context , String message){
    var snackBar = SnackBar(
      content: Text('$message'),
    );
  
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}



