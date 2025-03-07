import 'dart:developer';

import 'package:get/get.dart';
import 'package:pharma_connect_app/modules/my_order/order_page.dart';

class DetailsController extends GetxController {
  var quantity = 1.obs;
  var notificationCount = 3.obs;

  void increaseQuantity() {
    if (quantity < 12) {
      quantity++;
    }
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void placeOrder() {
    log("Order placed for $quantity items");
    Get.to(OrderPage());
  }
}
