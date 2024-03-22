import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF598BCC),
          title: const Text(
            'Form Validation',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            Form(
              key: homeController.formStatekey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Espresso', labelText: 'Item'),
                      validator: (value) =>
                          homeController.validateItemRequired(value!),
                      onSaved: (value) => homeController.order.item = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: '3', labelText: 'Quantity'),
                      validator: (value) =>
                          homeController.validateItemCount(value!),
                      onSaved: (value) =>
                          homeController.order.quantity = int.tryParse(value!),
                    ),
                    Divider(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () => homeController.submitOrder(),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen),
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}

class Order {
  String? item;
  int? quantity;
}
