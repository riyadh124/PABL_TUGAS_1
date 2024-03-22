import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_u_g_form_validation_2011058/app/modules/home/views/home_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final GlobalKey<FormState> formStatekey = GlobalKey<FormState>();

  // Order to save
  Order order = Order();

  String? validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : null;
  }

  String? validateItemCount(String value) {
    // Check if value is not null and convertto integer
    int? valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
    return valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  void submitOrder() {
    if (formStatekey.currentState!.validate()) {
      formStatekey.currentState!.save();
      print('Order Item: ${order.item}');
      print('Order Quantity: ${order.quantity}');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
