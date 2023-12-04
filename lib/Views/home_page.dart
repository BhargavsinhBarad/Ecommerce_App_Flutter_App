import 'package:af_exam_2/Helper/api_helper.dart';
import 'package:af_exam_2/Views/details_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/api_model.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Blipkart"),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: api_helper.api.getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<api_model>? apimodel = snapshot.data as List<api_model>?;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 230,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                  ),
                  itemCount: apimodel?.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          details_page(),
                          arguments: {
                            "id": apimodel?[i].id,
                            "title": apimodel?[i].title,
                            "description": apimodel?[i].description,
                            "price": apimodel?[i].price,
                            "discountPercentage":
                                apimodel?[i].discountPercentage,
                            "rating": apimodel?[i].rating,
                            "stock": apimodel?[i].stock,
                            "brand": apimodel?[i].brand,
                            "category": apimodel?[i].category,
                            "thumbnail": apimodel?[i].thumbnail,
                            "images": apimodel?[i].images,
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            // darker shadow on the bottom right
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 15,
                              offset: Offset(5, 5),
                            ),

                            // lighter shadow on the top left
                            const BoxShadow(
                              color: Colors.white,
                              blurRadius: 15,
                              offset: Offset(-5, -5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "${apimodel?[i].thumbnail}",
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 12, top: 5),
                                        child: Text(
                                          "${apimodel?[i].title}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, bottom: 5),
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text(
                                      "${apimodel?[i].brand}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        "\$ ${apimodel?[i].price}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
