import 'package:flutter/material.dart';
import 'package:taskapp/core/constants/constants.dart';
import 'package:taskapp/core/extentions/color_extension.dart';
import 'package:taskapp/core/extentions/context_extension.dart';
import 'package:taskapp/core/extentions/int_extension.dart';
import 'package:taskapp/core/extentions/text_theme_extension.dart';
import 'package:taskapp/modules/products/models/m_products.dart';

class WProductItem extends StatelessWidget {
  final MProduct product;

  const WProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isWide = Constants.constValues.isWideScreen(context);

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        margin: const EdgeInsets.only(left: 4, right: 4),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.thumbnail ?? '',
                width: 75,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (context, _, __) {
                  return Container(
                    color: Colors.grey.withOpacity(0.7),
                    width: 75,
                    height: 75,
                  );
                },
              ),
            ),
            12.createHorizontalGep(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: isWide ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? 'No Title',
                    style: context.textTheme.titleSemiBold_16(context).copyWith(
                          color: context.theme.colorScheme.primaryColor,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${product.price ?? 'N/A'}',
                    style: context.textTheme.titleSemiBold_14(context).copyWith(
                          color: context.theme.colorScheme.blackColor,
                        ),
                  ),
                ],
              ),
            ),
            12.createHorizontalGep(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
