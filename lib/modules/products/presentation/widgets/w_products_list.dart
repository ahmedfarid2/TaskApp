import 'package:flutter/material.dart';
import 'package:taskapp/modules/products/models/m_products.dart';
import 'package:taskapp/modules/products/presentation/widgets/w_product_item.dart';
import 'package:taskapp/modules/products/state_managment/products_cubit.dart';

class WProductsList extends StatelessWidget {
  const WProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsCubit cubit = ProductsCubit.instance;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              controller: cubit.scrollController,
              itemCount: (cubit.productsList.products?.length ?? 0) + (cubit.isLoading ? 1 : 0),
              padding: EdgeInsets.only(bottom: size.height * 0.02),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) =>  SizedBox(
                height:  size.height * 0.02,
              ),
              itemBuilder: (context, index) {
                if (index < (cubit.productsList.products?.length ?? 0)) {
                  MProduct product = cubit.productsList.products![index];
                  return WProductItem(product: product);
                } else {
                  return Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
