import 'dart:developer';

import 'package:af_exam_2/Controller/count.dart';
import 'package:af_exam_2/Views/Utils/List.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cart_page extends StatelessWidget {
  cart_page({super.key});
  countercontter Counter = Get.put(countercontter());
  var total = 0;
  var t = 0;
  @override
  CarouselController carouselController = CarouselController();
  Widget build(BuildContext context) {
    cartproduct.forEach(
      (e) {
        total += e['price'] as int;
        log("${total}");
      },
    );
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
      body: Column(
        children: [
          Expanded(
            flex: 16,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cartproduct.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text("${cartproduct[i]['title']}"),
                    leading: Container(
                      height: 150,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${cartproduct[i]['thumbnail']}"),
                              fit: BoxFit.cover)),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          height: 50,
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Counter.Decrement();
                                },
                                icon: const Icon(
                                  CupertinoIcons.minus,
                                  size: 22,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${Counter.countmodel.counter}",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Counter.Increment();
                                },
                                icon: const Icon(
                                  CupertinoIcons.add,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Obx(
                          () => Text(
                            " \$ ${Counter.countmodel.counter * cartproduct[i]['price']}",
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              height: 150,
              width: 150,
              child: Center(
                child: Text(
                  "${total} \$",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
