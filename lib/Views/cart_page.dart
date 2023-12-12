import 'dart:developer';

import 'package:af_exam_2/Controller/count.dart';
import 'package:af_exam_2/Controller/total.dart';
import 'package:af_exam_2/Views/Utils/List.dart';
import 'package:af_exam_2/Views/pdf.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class cart_page extends StatefulWidget {
  cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  countercontter Counter = Get.put(countercontter());
  totalcontter sum = Get.put(totalcontter());

  @override
  CarouselController carouselController = CarouselController();
  totalcontter totalcontroller = totalcontter();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      sum.sum();
    });
  }

  Widget build(BuildContext context) {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(pdf_page());
        },
        child: Icon(Icons.picture_as_pdf),
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
                  "\$ ${sum.ta.total} ",
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
