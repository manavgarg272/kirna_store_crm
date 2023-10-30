import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirana_store_crm/core/common_widget/common_widgets.dart';
import 'package:kirana_store_crm/core/common_widget/image_picker_widget.dart';
import 'package:kirana_store_crm/core/common_widget/text_input_field.dart';
import 'package:kirana_store_crm/feature/add_category/data/model/category_model.dart';
import 'package:kirana_store_crm/feature/add_category/presentation/manager/get_all_category_notifier.dart';
import 'package:kirana_store_crm/feature/add_products/data/model/product_model.dart';
import 'package:kirana_store_crm/feature/add_products/presentation/manager/add_product_notifier.dart';
import 'package:kirana_store_crm/feature/sub_category/data/model/sub_category_model.dart';
import 'package:kirana_store_crm/feature/sub_category/presentation/manager/get_sub_category_notifier.dart';
import 'package:provider/provider.dart';

class AddProductList extends StatefulWidget {
  const AddProductList({super.key});

  @override
  State<AddProductList> createState() => _AddProductListState();
}

class _AddProductListState extends State<AddProductList> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? productNameController = TextEditingController();
  TextEditingController? productQuantityController = TextEditingController();
  TextEditingController? productPriceController = TextEditingController();
  TextEditingController? productDescriptionController = TextEditingController();
  TextEditingController? productQuantityLeftController =
      TextEditingController();

  List<String> imageListUrl = [];

  String selectedItem = 'ATTA_RICE_DAL'; // Initially selected item
  late SubCategoryModel selectedSubCategoryItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(size.height / 30),
                child: Text(
                  "Add Products",
                  style: GoogleFonts.roboto(
                      fontSize: size.height / 40, fontWeight: FontWeight.bold),
                )),
            InputTextField(
              hintText: 'Product Name',
              controller: productNameController,
            ),
            InputTextField(
              hintText: 'Product Quantity Left in Number',
              keyboardType: TextInputType.number,
              controller: productQuantityController,
            ),
            InputTextField(
              hintText: 'Product Price in Number',
              keyboardType: TextInputType.number,
              controller: productPriceController,
            ),
            InputTextField(
              hintText: 'Product Description',
              controller: productDescriptionController,
            ),
            InputTextField(
              hintText: 'Product Quantity in String',
              controller: productQuantityLeftController,
            ),
            Container(
              margin: EdgeInsets.all(size.height / 50),
              child: DropdownButtonFormField<String>(
                value: selectedItem,
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
                    selectedItem = newValue ?? "";
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
            Container(
              margin: EdgeInsets.all(size.height / 50),
              child: DropdownButtonFormField<SubCategoryModel>(
                value:
                    context.watch<GetSubCategoryNotifier>().subCategoryModel[0],
                items: context
                    .watch<GetSubCategoryNotifier>()
                    .subCategoryModel
                    .map((SubCategoryModel item) {
                  return DropdownMenuItem<SubCategoryModel>(
                    value: item,
                    child: Text(item.subCategoryId),
                  );
                }).toList(),
                borderRadius: BorderRadius.circular(10),
                decoration: InputDecoration(
                  labelText: 'Select an item', // You can customize the label
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  filled: true,
                  fillColor:
                      Colors.grey.shade200, // You can customize the fill color
                ),
                onChanged: (SubCategoryModel? value) {
                  setState(() {
                    selectedSubCategoryItem = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Row(
              children: [
                ImagePickerWidget(
                  callback: (String imageFilLink) {
                    imageListUrl.add(imageFilLink);
                  },
                ),
                /* ImagePickerWidget(
                  callback: (String imageFilLink) {
                    imageListUrl.add(imageFilLink);
                  },
                ),
                ImagePickerWidget(
                  callback: (String imageFilLink) {
                    imageListUrl.add(imageFilLink);
                  },
                ),
                ImagePickerWidget(
                  callback: (String imageFilLink) {
                    imageListUrl.add(imageFilLink);
                  },
                ), */
              ],
            ),
            OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      imageListUrl.length >= 1) {
                    await context.read<AddProductNotifer>().addProductsToData(
                        product: ProductModel(
                            productName: productNameController!.text,
                            productQuantity:
                                int.parse(productQuantityController!.text),
                            productQuatityLeft:
                                productQuantityLeftController!.text,
                            imagesList: imageListUrl,
                            subCategoryId: selectedSubCategoryItem.subCategoryId,
                            categoryId: selectedItem,
                            productPrice:
                                int.parse(productPriceController!.text),
                            productDescription:
                                productDescriptionController!.text));

                    if (context
                            .read<AddProductNotifer>()
                            .addProductNotiferState ==
                        AddProductNotiferState.loaded) {
                      productNameController!.clear();
                      productQuantityController!.clear();
                      productQuantityLeftController!.clear();
                      imageListUrl.clear();
                      productDescriptionController!.clear();
                      productPriceController!.clear();
                      selectedItem = "ATTA_RICE_DAL";

                      context.read<AddProductNotifer>().addProductNotiferState =
                          AddProductNotiferState.initial;
                      CommonWidgetShow().showSnackBarWidget(
                          context, "Product Saved Successfully");
                    }
                  }
                },
                child: Text("Add Product")),

              SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
