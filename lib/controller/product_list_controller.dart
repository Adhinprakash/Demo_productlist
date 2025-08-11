import 'package:demoapp/model/product_model.dart';
import 'package:demoapp/services/api_services.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  final ApiServices apiService = Get.find<ApiServices>();

  // Observable variables
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isRefreshing = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await apiService.getProducts();

      if (result['success']) {
        final List<dynamic> productList = result['data'];
        products.value = productList
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        errorMessage.value = result['message'];
      }
    } catch (e) {
      errorMessage.value = 'Failed to load products';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshProducts() async {
    try {
      isRefreshing.value = true;
      errorMessage.value = '';

      final result = await apiService.getProducts();

      if (result['success']) {
        final List<dynamic> productList = result['data'];
        products.value = productList
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        errorMessage.value = result['message'];
      }
    } catch (e) {
      errorMessage.value = 'Failed to refresh products';
    } finally {
      isRefreshing.value = false;
    }
  }

  
}