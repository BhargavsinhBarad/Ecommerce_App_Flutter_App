import 'package:af_exam_2/Helper/api_helper.dart';
import 'package:af_exam_2/Views/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/api_model.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Home page"),
        centerTitle: true,
      ),
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
                              offset: Offset(10, 10),
                            ),

                            // lighter shadow on the top left
                            const BoxShadow(
                              color: Colors.white,
                              blurRadius: 15,
                              offset: Offset(-10, -10),
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
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 2.5),
                                      child: Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Text("${apimodel?[i].title}")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 5),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text("${apimodel?[i].brand}"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child:
                                              Text("${apimodel?[i].price} \$")),
                                    ),
                                  ],
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
