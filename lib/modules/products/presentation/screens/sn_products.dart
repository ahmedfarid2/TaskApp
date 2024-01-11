import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapp/core/extentions/color_extension.dart';
import 'package:taskapp/core/extentions/context_extension.dart';
import 'package:taskapp/core/services/routes/routes_names.dart';
import 'package:taskapp/modules/products/presentation/widgets/w_lang_toggle.dart';
import 'package:taskapp/modules/products/presentation/widgets/w_products_list.dart';
import 'package:taskapp/modules/products/state_managment/products_cubit.dart';

class SNProducts extends StatefulWidget {
  const SNProducts({super.key});

  @override
  State<SNProducts> createState() => _SNProductsState();
}

class _SNProductsState extends State<SNProducts> {
  final ProductsCubit cubit = ProductsCubit.instance;
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products'.tr()),
        centerTitle: false,
        actions:  const [
          WLangToggle(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.colorScheme.primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed(RoutesNames.products.addProducts);
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),

      body: BlocConsumer<ProductsCubit, ProductsState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is GetProductsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error loading products'.tr())),
            );
          }
        },
        builder: (context, state) {
          if (cubit.productsList.products?.isNotEmpty == true) {
            return WProductsList();
          } else if (state is GetProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('No products available'.tr()));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    cubit.scrollController.dispose();
    super.dispose();
  }
}
