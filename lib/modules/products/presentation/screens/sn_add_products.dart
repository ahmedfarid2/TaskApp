import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskapp/core/extentions/context_extension.dart';
import 'package:taskapp/core/extentions/text_theme_extension.dart';
import 'package:taskapp/core/widgets/w_app_button.dart';
import 'package:taskapp/core/widgets/w_shared_input.dart';
import 'package:taskapp/modules/products/state_managment/products_cubit.dart';

class SNAddProducts extends StatefulWidget {
  const SNAddProducts({super.key});

  @override
  State<SNAddProducts> createState() => _SNAddProductsState();
}

class _SNAddProductsState extends State<SNAddProducts> {
  final ProductsCubit cubit = ProductsCubit.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.formAddProduct.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add_product'.tr(),
          style: context.textTheme.titleBold_20(context),
        ),
      ),
      body: Form(
        key: cubit.formAddProduct.key,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            WSharedInput(
              controller: cubit.formAddProduct.titleController,
              title: "title",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'title_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.text,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.descriptionController,
              title: "description",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'description_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.text,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.priceController,
              title: "price",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'price_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.number,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.discountPercentageController,
              title: "discount_percentage",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'discount_percentage_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.number,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.ratingController,
              title: "rating",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'rating_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.number,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.stockController,
              title: "stock",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'stock_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.number,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.brandController,
              title: "brand",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'brand_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.text,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            WSharedInput(
              controller: cubit.formAddProduct.categoryController,
              title: "category",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'category_error'.tr();
                }
                return null;
              },
              onChanged: (_) {
                setState(() {
                  cubit.checkAddProductsValidation();
                });
              },
              textInputType: TextInputType.text,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            WAppButton(
              title: "submit".tr(),
              isDisabled: cubit.submitButton,
              onTap: () {
                if (cubit.formAddProduct.key.currentState?.validate() ?? false) {
                  cubit.addProduct();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
