import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kirana_store_crm/core/services/fireabse_service/firebase_service.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(String) callback;
  
  const ImagePickerWidget({super.key, required this.callback});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      String imageFile = await FirestoreDatabase().uploadFile(_image);
      widget.callback(imageFile);
       setState(() {});
    } else {
      print('No image selected.');
    }
  }
  
  void clearImage() {
    setState(() {
      _image = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(size.height / 30),
      child: _image != null
          ? GestureDetector(
              onTap: () async {
                imgFromGallery();
              },
              child: Container(
                height: size.height / 4,
                width: size.width / 5,
                child: Image.network(_image!.path),
              ),
            )
          : GestureDetector(
              onTap: () async {
                imgFromGallery();
              },
              child: Container(
                height: size.height / 6,
                width: size.width / 6,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child:const Text("Pick Image"),
              ),
            ),
    );
  }
}


