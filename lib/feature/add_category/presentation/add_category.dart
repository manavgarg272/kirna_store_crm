import 'package:flutter/material.dart';
import 'package:kirana_store_crm/core/common_widget/common_widgets.dart';
import 'package:kirana_store_crm/core/common_widget/image_picker_widget.dart';
import 'package:kirana_store_crm/core/common_widget/text_input_field.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/manager/category_notifier.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  String categoryImageUrl = "";
  TextEditingController? categoryIdController = new TextEditingController();
  TextEditingController? categoryNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(size.height / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category page",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: size.height / 30),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            InputTextField(
                controller: categoryIdController,
                validator: (value) {
                  if (RegExp(r'^[A-Z_]+$').hasMatch(value ?? "")) {
                  } else {
                    return "Invalid NAMKEEN_CATEGORY";
                  }
                  return null;
                },
                hintText: "Category Identifier"),
            InputTextField(
                controller: categoryNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Invalid NAMKEEN NAME";
                  }
                },
                hintText: "Category Name"),
            SizedBox(
              height: size.height / 30,
            ),
            ImagePickerWidget(
              callback: (String imageFileLink) {
             
                setState(() {
                  categoryImageUrl = imageFileLink;
                });
            
              },
            ),
            SizedBox(
              height: size.height / 30,
            ),
            OutlinedButton(
                onPressed: ()async {
                  if (_formKey.currentState!.validate() && categoryImageUrl.length!=0) {
                 await  context.read<CategoryNotifier>().storeCategoryData(
                        data: CategoryModel(
                            categoryId: categoryIdController!.text,
                            categoryImage: categoryImageUrl,
                            categoryName: categoryNameController!.text));
                    if (context
                            .read<CategoryNotifier>()
                            .categoryNotifierState ==
                        CategoryNotifierState.loaded) {

                          categoryIdController!.clear();
                          categoryNameController!.clear();
                          categoryImageUrl="";
                        }
                        CommonWidgetShow().showSnackBarWidget(context, "CATEGORY ADDED SUCCESSFULLY");
                  }
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
