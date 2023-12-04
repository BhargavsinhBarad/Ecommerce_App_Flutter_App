import 'package:af_exam_2/Views/Utils/List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cart_page extends StatelessWidget {
  const cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cartproduct.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text("${cartproduct[i]['title']}"),
            ),
          );
        },
      ),
    );
  }
}
