import 'package:demoapp/utils/constant.dart';
import 'package:demoapp/view/widgets/emptystate_widget.dart';
import 'package:demoapp/view/widgets/loadingwidget.dart';
import 'package:demoapp/view/widgets/productcard_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demoapp/controller/product_list_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductListController controller = Get.put(ProductListController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor:kprimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.products.isEmpty) {
          return const LoadingWidget();
        }

        if (controller.products.isEmpty && !controller.isLoading.value) {
          return EmptyStateWidget(
            onRetry: () => controller.fetchProducts(),
            errorMessage: controller.errorMessage.value,
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshProducts,
          color: kprimary,
          backgroundColor: Colors.white,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              if (controller.errorMessage.value.isNotEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, color:kred),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            controller.errorMessage.value,
                            style: TextStyle(
                              color:kred,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.errorMessage.value = '',
                          icon: Icon(Icons.close, color: kred),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = controller.products[index];
                      return ProductCard(product: product);
                    },
                    childCount: controller.products.length,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}