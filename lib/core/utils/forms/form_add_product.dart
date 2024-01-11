import 'package:flutter/material.dart';

class FormAddProduct {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountPercentageController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  void clear() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    discountPercentageController.clear();
    ratingController.clear();
    stockController.clear();
    brandController.clear();
    categoryController.clear();
  }
}
