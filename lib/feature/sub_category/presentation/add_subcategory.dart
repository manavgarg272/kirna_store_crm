import 'package:flutter/material.dart';
import 'package:kirana_store_crm/core/common_widget/common_widgets.dart';
import 'package:kirana_store_crm/core/common_widget/image_picker_widget.dart';
import 'package:kirana_store_crm/core/common_widget/text_input_field.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/manager/get_all_category_notifier.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/presentation/manager/sub_category_notifier.dart';
import 'package:provider/provider.dart';

class SubCategoryData extends StatefulWidget {
  const SubCategoryData({super.key});

  @override
  State<SubCategoryData> createState() => _SubCategoryDataState();
}

class _SubCategoryDataState extends State<SubCategoryData> {
  String subCategoryImageUrl = "";
  TextEditingController subCategoryName = TextEditingController();
  TextEditingController subCategoryId = TextEditingController();
  String selectedSubItem = "ATTA_RICE_DAL";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Sub Category page",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: size.height / 30),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          InputTextField(
              controller: subCategoryId,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Invalid Subcategory Id";
                }
                return null;
              },
              hintText: "SubCategoryId"),
          SizedBox(
            height: size.height / 30,
          ),
          InputTextField(
              controller: subCategoryName, hintText: "SubCategoryName"),
          SizedBox(
            height: size.height / 30,
          ),
          Container(
            margin: EdgeInsets.all(size.height / 50),
            child: DropdownButtonFormField<String>(
              value: selectedSubItem,
              items: context
                  .watch<GetAllCategoryNotifer>()
                  .categoryListData
                  .map((CategoryModel item) {
                return DropdownMenuItem<String>(
                  value: item.categoryId,
                  child: Text(item.categoryId),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSubItem = newValue ?? "";
                });
              },
              borderRadius: BorderRadius.circular(10),
              decoration: InputDecoration(
                labelText: 'Select an item', // You can customize the label
                border: const OutlineInputBorder(
                  // You can customize the border
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor:
                    Colors.grey.shade200, // You can customize the fill color
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          
          ImagePickerWidget(
            callback: (String imageFileLink) {
              setState(() {
                subCategoryImageUrl = imageFileLink;
              });
            },
          ),
          OutlinedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() &&
                  selectedSubItem.isNotEmpty &&
                  subCategoryImageUrl.isNotEmpty) {
                try {
                  // Call the addSubCategoryData method and wait for the result
                  await context.read<SubCategoryNotifier>().addSubCategoryData(
                        params: SubCategoryModel(
                          subCategoryId: subCategoryId.text,
                          categoryId: selectedSubItem,
                          imageLink: subCategoryImageUrl,
                          subCategoryName: subCategoryName.text,
                        ),
                      );

                  // Check the state of the SubCategoryNotifier
                  final subCategoryNotifier =
                      context.read<SubCategoryNotifier>();

                  if (subCategoryNotifier.subCategoryNotifierState ==
                      SubCategoryNotifierState.loaded) {
                    // Clear form fields and reset variables on success
                    subCategoryId.clear();
                    selectedSubItem = "ATTA_RICE_DAL";
                    subCategoryImageUrl = "";
                    subCategoryName.clear();
                    CommonWidgetShow().showSnackBarWidget(
                        context, "Sub Category Added To Data");
                  } else {
                    // Handle other states (e.g., error or loading) if needed
                  }
                } catch (e) {
                  // Handle any exceptions that might occur during the process
                  print("Error adding subcategory: $e");
                }
              }
            },
            child: const Text("Add Sub Product"),
          )
        ],
      ),
    );
  }
}
