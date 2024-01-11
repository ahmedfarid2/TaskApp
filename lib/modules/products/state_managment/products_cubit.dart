import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taskapp/core/services/network/api/api_products.dart';
import 'package:taskapp/core/utils/forms/app_forms.dart';
import 'package:taskapp/core/utils/forms/form_add_product.dart';
import 'package:taskapp/modules/products/models/m_products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  /// Singleton Pattern
  static final ProductsCubit _instance = ProductsCubit._internal();
  factory ProductsCubit() => _instance;
  ProductsCubit._internal() : super(ProductsInitial()) {
    scrollController.addListener(onScroll);
  }

  static ProductsCubit get instance => _instance;

  // [Variables]
  final ApiProducts apiProducts = ApiProducts();
  MProducts productsList = MProducts();
  bool isFullyLoaded = false;
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  int limit = 10;
  int skip = 0;

  bool submitButton = true;

  FormAddProduct formAddProduct = AppForms.formAddProduct;

  // [Methods]
  Future<void> getProducts({bool isInitialLoad = true}) async {
    if (isFullyLoaded) return;

    isLoading = true;
    emit(GetProductsLoading());

    if (isInitialLoad) {
      skip = 0;
    } else {
      skip += limit;
    }

    try {
      final newProducts = await apiProducts.getAllProducts(limit: limit, skip: skip);
      if (isInitialLoad) {
        productsList = newProducts;
      } else {
        productsList.products?.addAll(newProducts.products ?? []);
      }
      if (productsList.products?.length == newProducts.total) {
        isFullyLoaded = true;
      }
      isLoading = false;
      emit(GetProductsSuccess());
    } catch (e) {
      isLoading = false;
      emit(GetProductsError());
    }
  }

  Future<void> addProduct() async {
    try {
      emit(AddProductsLoading());
      MProduct product = MProduct(
        id: 101,
        title: formAddProduct.titleController.text,
        description: formAddProduct.descriptionController.text,
        price: int.tryParse(formAddProduct.priceController.text),
        rating: double.tryParse(formAddProduct.ratingController.text),
        discountPercentage: double.tryParse(formAddProduct.discountPercentageController.text),
        stock: int.tryParse(formAddProduct.stockController.text),
        brand: formAddProduct.brandController.text,
        category: formAddProduct.categoryController.text,
        thumbnail: "test",
        images: ["test", "test2"],
      );

      final MProduct productResponse = await apiProducts.addProduct(product);
      formAddProduct.clear();
      emit(AddProductsSuccess(product: productResponse));
    } catch (e) {
      emit(AddProductsError());
    }
  }

  void onScroll() {
    if (isBottom && !isLoading && !isFullyLoaded) {
      getProducts(isInitialLoad: false);
    }
  }

  bool get isBottom {
    if (!scrollController.hasClients || isFullyLoaded) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void checkAddProductsValidation() {
    var isValid = formAddProduct.titleController.text.isNotEmpty &&
        formAddProduct.descriptionController.text.isNotEmpty &&
        formAddProduct.priceController.text.isNotEmpty &&
        formAddProduct.ratingController.text.isNotEmpty &&
        formAddProduct.discountPercentageController.text.isNotEmpty &&
        formAddProduct.stockController.text.isNotEmpty &&
        formAddProduct.categoryController.text.isNotEmpty &&
        formAddProduct.brandController.text.isNotEmpty;
    submitButton = !isValid;
  }
}
