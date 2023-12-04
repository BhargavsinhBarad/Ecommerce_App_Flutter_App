import 'package:af_exam_2/Controller/like.dart';
import 'package:af_exam_2/Views/home_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/count.dart';

class details_page extends StatelessWidget {
  details_page({super.key});
  countercontter Counter = Get.put(countercontter());
  likecontroller like = Get.put(likecontroller());

  @override
  CarouselController carouselController = CarouselController();
  likecontroller likecontrolle = likecontroller();

  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List img = data['images'];

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Counter.countmodel.counter = 1.obs;
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 450,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(seconds: 2),
                disableCenter: true,
              ),
              carouselController: carouselController,
              items: [
                ...data['images']
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.all(20),
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                          image: DecorationImage(
                              image: NetworkImage(e), fit: BoxFit.cover),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("${data['title']}",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "${data['brand']}",
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          "⭐️ ${data['rating']}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "10K Reviews",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Row(
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
                            Obx(() => Text(
                                  "${Counter.countmodel.counter}",
                                  style: TextStyle(fontSize: 22),
                                )),
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Obx(
                            () => Text(
                              " \$ ${Counter.countmodel.counter * data['price']}",
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "Discount: ${data['discountPercentage']}\%",
                        style: TextStyle(
                            fontSize: 23,
                            color: CupertinoColors.systemRed,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "About Product",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "${data['description']}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.06,
                        child: IconButton(
                          onPressed: () {
                            like.like();
                          },
                          icon: GetBuilder<likecontroller>(
                            builder: (val) => Icon(
                              Icons.favorite,
                              color: (like.l1.like == true)
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.6,
                        height: Get.height * 0.06,
                        child: Center(
                            child: Text(
                          "Add To Cart",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                          color:
                              CupertinoColors.destructiveRed.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
