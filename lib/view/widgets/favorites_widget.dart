import 'package:demoapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FavoritesWidget extends StatelessWidget {
    final ProductModel product;

  const FavoritesWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.black87),
                    onPressed: () {
                      Get.snackbar(
                        'Added to Favorites',
                        product.title,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.deepPurple,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                        duration: const Duration(seconds: 2),
                      );
                    },
                  ),
                );
  }
}