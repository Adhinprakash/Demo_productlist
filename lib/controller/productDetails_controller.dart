import 'package:demoapp/model/product_model.dart';
import 'package:demoapp/services/api_services.dart';
import 'package:get/get.dart';


class ProductDetailController extends GetxController {
  final ApiServices apiService = Get.find<ApiServices>();

  final Rx<ProductModel?> product = Rx<ProductModel?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    
    final ProductModel? argumentProduct = Get.arguments as ProductModel?;
    if (argumentProduct != null) {
      product.value = argumentProduct;
      fetchProductDetails(argumentProduct.id);
    }
  }

  Future<void> fetchProductDetails(int productId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

    
      final result = await apiService.getProduct(productId);

      if (result['success']) {
        product.value = ProductModel.fromJson(result['data']);
      } else {
        errorMessage.value = result['message'];
      }
    } catch (e) {
      errorMessage.value = 'Failed to load product details';
    } finally {
      isLoading.value = false;
    }
  }
}